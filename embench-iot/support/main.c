/* Common main.c for the benchmarks

   Copyright (C) 2014 Embecosm Limited and University of Bristol
   Copyright (C) 2018-2019 Embecosm Limited

   Contributor: James Pallister <james.pallister@bristol.ac.uk>
   Contributor: Jeremy Bennett <jeremy.bennett@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

#include "support.h"

unsigned long spike_start_cycle, spike_stop_cycle;	// Added for the simulation with SPIKE by SoCLab


int __attribute__ ((used))
main (int argc __attribute__ ((unused)),
      char *argv[] __attribute__ ((unused)))
{
  int i;
  volatile int result;
  int correct;

  // Added for the simulation with SPIKE by SoCLab
  spike_start_cycle = 0;
  spike_stop_cycle = 0;

  initialise_board ();
  initialise_benchmark ();
  warm_caches (WARMUP_HEAT);

  start_trigger ();
  result = benchmark ();
  stop_trigger ();

  /* bmarks that use arrays will check a global array rather than int result */

  correct = verify_benchmark (result);

#ifdef SPIKE_SIM
  printf("CYCLES=%ld\n", spike_stop_cycle - spike_start_cycle);
#endif

  return (!correct);
}				/* main () */


/*
   Local Variables:
   mode: C
   c-file-style: "gnu"
   End:
*/
