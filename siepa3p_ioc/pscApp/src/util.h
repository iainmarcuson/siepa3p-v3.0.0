#ifndef PSC_UTIL_H
#define PSC_UTIL_H

#include <stdio.h>

#include <compilerDependencies.h>

#ifdef __cplusplus
extern "C" {
#endif

int timefprintf(FILE* fp, const char *str, ...) EPICS_PRINTF_STYLE(2,3);
int timeprintf(const char *str, ...) EPICS_PRINTF_STYLE(1,2);

#ifdef __cplusplus
}
#endif

#endif /* PSC_UTIL_H */
