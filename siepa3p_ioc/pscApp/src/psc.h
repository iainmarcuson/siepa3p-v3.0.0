#ifndef PSC_H
#define PSC_H

#include "evbase.h"

#include <epicsTypes.h>
#include <dbScan.h>
#include <epicsGuard.h>
#include <epicsEvent.h>
#include <epicsTime.h>

#include <string>
#include <map>
#include <vector>
#include <set>
#include <exception>

#include <event2/event.h>
#include <event2/dns.h>
#include <event2/bufferevent.h>
#include <event2/buffer.h>

#include "cblist.h"

class recAlarm : public std::exception
{
public:
    short status, severity;
    recAlarm();
    recAlarm(short sts, short sevr);
    virtual const char *what();
};

typedef epicsGuard<epicsMutex> Guard;
typedef epicsGuardRelease<epicsMutex> UnGuard;

class BEVGuard
{
    bufferevent *bev;
public:
    BEVGuard(bufferevent *b) : bev(b)
    {
        bufferevent_lock(bev);
    }
    ~BEVGuard()
    {
        bufferevent_unlock(bev);
    }
};

class dbCommon;
class PSC;

struct Block
{
    PSC& psc;
    const epicsUInt16 code;

    typedef std::vector<char> data_t;
    data_t data;

    bool queued;

    IOSCANPVT scan;
    CBList<Block> listeners;

    epicsUInt32 count; // TX or RX counter

    epicsTime rxtime; // RX timestamp

    Block(PSC*, epicsUInt16);

    void queue();
    void notify();
};

// User code must lock PSC::lock before
// any access to methods or other members.
class PSC
{
public:
    const std::string name;
    const std::string host;
    const unsigned short port;

    typedef std::map<epicsUInt16, Block*> block_map;
private:
    unsigned int mask;

    EventBase::pointer base;
    event *reconnect_timer;
    bool timer_active;
    evdns_base *dns;
    bufferevent *session;

    bool connected;

    epicsUInt32 ukncount; // RX counter for unknown blocks
    epicsUInt32 conncount; // # of successful connections

    // RX message decoding
    bool have_head;
    epicsUInt16 header;
    epicsUInt32 bodylen;
    Block *bodyblock;
    size_t expect;

    evbuffer *sendbuf;

    block_map send_blocks, recv_blocks;

public:
    PSC(const std::string& name,
        const std::string& host,
        unsigned short port,
        unsigned int timeoutmask);
    virtual ~PSC();

    mutable epicsMutex lock;

    Block* getSend(epicsUInt16);
    Block* getRecv(epicsUInt16);

    void send(epicsUInt16);
    void queueSend(epicsUInt16, const void*, epicsUInt32);
    void queueSend(Block*, const void*, epicsUInt32);

    void flushSend();
    void forceReConnect();

    inline bool isConnected() const{return connected;}
    inline std::string lastMessage() const{return message;}

    inline epicsUInt32 getUnknownCount() const {return ukncount;}
    inline epicsUInt32 getConnCount() const {return conncount;}

    std::string message;
    IOSCANPVT scan;

    void report(int lvl);
private:

    void sendblock(Block*);

    void connect();
    void start_reconnect();

    // libevent callbacks
    void eventcb(short);
    void recvdata();
    void stop();
    void reconnect();

    static void bev_eventcb(bufferevent*,short,void*);
    static void bev_datacb(bufferevent*, void*);
    static void bev_reconnect(int,short,void*);
    static void ioc_atexit(void*);

    typedef std::map<std::string, PSC*> pscmap_t;
    static pscmap_t pscmap;

public:
    static void startAll();
    static PSC* getPSC(const std::string&);
    template<typename FN, typename ARG>
    static bool visit(FN fn, ARG arg) {
        bool val = true;
        pscmap_t::const_iterator it, end = pscmap.end();
        for(it=pscmap.begin(); it!=end; ++it) {
            val = fn(arg, it->second);
            if(!val) break;
        }
        return val;
    }
};

#endif // PSC_H
