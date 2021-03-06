/* Copyright (C) 2017 Embecosm Limited and University of Bristol

   Contributor Graham Markall <graham.markall@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

#include <support.h>

extern unsigned long spike_start_cycle, spike_stop_cycle;  // Added for the simulation with SPIKE by SoCLab


void
initialise_board ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
start_trigger ()
{
  // __asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("rdcycle %0" : "=r" (spike_start_cycle));
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
stop_trigger ()
{
  // __asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("rdcycle %0" : "=r" (spike_stop_cycle));
}
