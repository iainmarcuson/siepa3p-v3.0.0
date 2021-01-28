/*
 * Copyright (c) 2006-2012 XIA LLC
 * All rights reserved
 *
 * Redistribution and use in source and binary forms,
 * with or without modification, are permitted provided
 * that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above
 *     copyright notice, this list of conditions and the
 *     following disclaimer.
 *   * Redistributions in binary form must reproduce the
 *     above copyright notice, this list of conditions and the
 *     following disclaimer in the documentation and/or other
 *     materials provided with the distribution.
 *   * Neither the name of XIA LLC
 *     nor the names of its contributors may be used to endorse
 *     or promote products derived from this software without
 *     specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
 * THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#ifndef __XIA_USB2_H__
#define __XIA_USB2_H__

#ifdef _WIN32
#include <windows.h>
#endif /* _WIN32 */

#include "Dlldefs.h"

#include "xia_common.h"

#ifdef __cplusplus
extern "C" {
#endif

  XIA_IMPORT int XIA_API xia_usb2_open(int dev, HANDLE *h);
  XIA_IMPORT int XIA_API xia_usb2_close(HANDLE h);
  XIA_IMPORT int XIA_API xia_usb2_read(HANDLE h, unsigned long addr,
                                       unsigned long n_bytes,
                                       byte_t *buf);
  XIA_IMPORT int XIA_API xia_usb2_readn(HANDLE h, unsigned long addr,
                                        unsigned long n_bytes,
                                        byte_t *buf, unsigned long *n_bytes_read);
  XIA_IMPORT int XIA_API xia_usb2_write(HANDLE h, unsigned long addr,
                                        unsigned long n_bytes,
                                        byte_t *buf);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __XIA_USB2_H__ */
