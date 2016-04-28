#ifndef WR_HPX_H
#define WR_HPX_H

#include <bindings.cmacros.h>
#include <hpx/hpx.h>
#include <stdint.h>

void     wr_hpx_time_add(hpx_time_t *dest, const hpx_time_t *start, const hpx_time_t *duration);
void     wr_hpx_time_construct(hpx_time_t *dest, const unsigned long s, const unsigned long ns);
void     wr_hpx_time_diff(const hpx_time_t *start, const hpx_time_t *end, hpx_time_t *diff);
double   wr_hpx_time_diff_ms(const hpx_time_t *from, const hpx_time_t *to);
int64_t  wr_hpx_time_diff_ns(const hpx_time_t *from, const hpx_time_t *to);
double   wr_hpx_time_diff_us(const hpx_time_t *from, const hpx_time_t *to);
void     wr_hpx_time_elapsed(const hpx_time_t *start, hpx_time_t *diff);
double   wr_hpx_time_elapsed_ms(const hpx_time_t *from);
uint64_t wr_hpx_time_elapsed_ns(const hpx_time_t *from);
double   wr_hpx_time_elapsed_us(const hpx_time_t *from);
uint64_t wr_hpx_time_from_start_ns(const hpx_time_t *t);
double   wr_hpx_time_ms(const hpx_time_t *from);
void     wr_hpx_time_now(hpx_time_t *dest);
double   wr_hpx_time_ns(const hpx_time_t *t);
double   wr_hpx_time_us(const hpx_time_t *from);

BC_INLINE_(HPX_ACTION_NULL,    hpx_action_t)
BC_INLINE_(HPX_ACTION_INVALID, hpx_action_t)

BC_INLINE_(HPX_CHAR,       hpx_type_t)
BC_INLINE_(HPX_UCHAR,      hpx_type_t)
BC_INLINE_(HPX_SCHAR,      hpx_type_t)
BC_INLINE_(HPX_SHORT,      hpx_type_t)
BC_INLINE_(HPX_USHORT,     hpx_type_t)
BC_INLINE_(HPX_SSHORT,     hpx_type_t)
BC_INLINE_(HPX_INT,        hpx_type_t)
BC_INLINE_(HPX_UINT,       hpx_type_t)
BC_INLINE_(HPX_SINT,       hpx_type_t)
BC_INLINE_(HPX_LONG,       hpx_type_t)
BC_INLINE_(HPX_ULONG,      hpx_type_t)
BC_INLINE_(HPX_SLONG,      hpx_type_t)
BC_INLINE_(HPX_VOID,       hpx_type_t)
BC_INLINE_(HPX_UINT8,      hpx_type_t)
BC_INLINE_(HPX_SINT8,      hpx_type_t)
BC_INLINE_(HPX_UINT16,     hpx_type_t)
BC_INLINE_(HPX_SINT16,     hpx_type_t)
BC_INLINE_(HPX_UINT32,     hpx_type_t)
BC_INLINE_(HPX_SINT32,     hpx_type_t)
BC_INLINE_(HPX_UINT64,     hpx_type_t)
BC_INLINE_(HPX_SINT64,     hpx_type_t)
BC_INLINE_(HPX_FLOAT,      hpx_type_t)
BC_INLINE_(HPX_DOUBLE,     hpx_type_t)
BC_INLINE_(HPX_POINTER,    hpx_type_t)
BC_INLINE_(HPX_LONGDOUBLE, hpx_type_t)
BC_INLINE_(HPX_SIZE_T,     hpx_type_t)
BC_INLINE_(HPX_ADDR,       hpx_type_t)
BC_INLINE_(HPX_ACTION_T,   hpx_type_t)

BC_INLINE_(HPX_ERROR,          hpx_status_t)
BC_INLINE_(HPX_SUCCESS,        hpx_status_t)
BC_INLINE_(HPX_RESEND,         hpx_status_t)
BC_INLINE_(HPX_LCO_ERROR,      hpx_status_t)
BC_INLINE_(HPX_LCO_CHAN_EMPTY, hpx_status_t)
BC_INLINE_(HPX_LCO_TIMEOUT,    hpx_status_t)
BC_INLINE_(HPX_LCO_RESET,      hpx_status_t)
BC_INLINE_(HPX_ENOMEM,         hpx_status_t)
BC_INLINE_(HPX_USER,           hpx_status_t)

#endif
