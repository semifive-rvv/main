#! /bin/bash

SPIKE_32=spike_32
SPIKE_64=spike_64
RUN_32=riscv32-unknown-elf-run
RUN_64=riscv64-unknown-elf-run
PK_32=/home/jong/Projects/RISCV/riscv32-unknown-elf/bin/pk
PK_64=/home/jong/Projects/RISCV/riscv64-unknown-elf/bin/pk

if [ "$#" -ne 2 ]; then
  echo "Error running simulation"
  echo "Usage: $0 sim_mode executable"
  echo "     sim_mode = 1: ${RUN_32} <executable>"     
  echo "     sim_mode = 2: ${SPIKE_32} ${PK_32} <executable>"
  echo "     sim_mode = 3: ${RUN_64} <executable>"     
  echo "     sim_mode = 4: ${SPIKE_64} ${PK_64} <executable>"
  echo "Example running a.out by using run program: $0 1 a.out"
  exit 2
fi

if [ ! -f $2 ]; then
  echo "Executable $2 does not exist"
  exit 3
fi

case $1 in 
  "1") 
    echo "### Running by using riscv32-unknown-elf-run $2"
    echo "----------------------------------------------"
    echo ""
    time ${RUN_32} $2
    ;;
  "2") 
    echo "### Running by using spike_32 $2"
    echo "----------------------------------------------"
    echo ""
    time ${SPIKE_32} ${PK_32} $2
    ;;
  "3") 
    echo "### Running by using riscv64-unknown-elf-run $2"
    echo "----------------------------------------------"
    echo ""
    time ${RUN_64} $2
    ;;
  "4") 
    echo "### Running by using spike_64 $2"
    echo "----------------------------------------------"
    echo ""
    time ${SPIKE_64} ${PK_64} $2
    ;;

  *) 
    echo "Wrong mode. MODE must be one of 1, 2, or 3"
    exit 2;;
esac

  
