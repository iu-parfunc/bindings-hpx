#ifndef WR_HPX_H
#define WR_HPX_H

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

#endif
