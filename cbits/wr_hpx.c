#include <hpx/hpx.h>
#include <stdint.h>
#include "wr_hpx.h"

void wr_hpx_time_add(hpx_time_t *dest, const hpx_time_t *start, const hpx_time_t *duration) {
  *dest = hpx_time_add(*start, *duration);
}

void wr_hpx_time_construct(hpx_time_t *dest, const unsigned long s, const unsigned long ns) {
  *dest = hpx_time_construct(s, ns);
}

void wr_hpx_time_diff(const hpx_time_t *start, const hpx_time_t *end, hpx_time_t *diff) {
  hpx_time_diff(*start, *end, diff);
}

double wr_hpx_time_diff_ms(const hpx_time_t *from, const hpx_time_t *to) {
  return hpx_time_diff_ms(*from, *to);
}

int64_t wr_hpx_time_diff_ns(const hpx_time_t *from, const hpx_time_t *to) {
  return hpx_time_diff_ns(*from, *to);
}

double wr_hpx_time_diff_us(const hpx_time_t *from, const hpx_time_t *to) {
  return hpx_time_diff_us(*from, *to);
}

void wr_hpx_time_elapsed(const hpx_time_t *start, hpx_time_t *diff) {
  hpx_time_elapsed(*start, diff);
}

double wr_hpx_time_elapsed_ms(const hpx_time_t *from) {
  return hpx_time_elapsed_ms(*from);
}

uint64_t wr_hpx_time_elapsed_ns(const hpx_time_t *from) {
  return hpx_time_elapsed_ns(*from);
}

double wr_hpx_time_elapsed_us(const hpx_time_t *from) {
  return hpx_time_elapsed_us(*from);
}

uint64_t wr_hpx_time_from_start_ns(const hpx_time_t *t) {
  return hpx_time_from_start_ns(*t);
}

double wr_hpx_time_ms(const hpx_time_t *from) {
  return hpx_time_ms(*from);
}

void wr_hpx_time_now(hpx_time_t *dest) {
  *dest = hpx_time_now();
}

double wr_hpx_time_ns(const hpx_time_t *t) {
  return hpx_time_ns(*t);
}

double wr_hpx_time_us(const hpx_time_t *from) {
  return hpx_time_us(*from);
}
