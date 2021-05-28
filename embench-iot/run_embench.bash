#! /bin/bash 
# This script is written by SoCLab

# Native compilation: ./build_all.py --arch native --board default --chip default --clean

EMBENCH_ROOT=$PWD

if [ "$#" -ne 1 ]; then
  echo "Running Embench "
  echo "Usage: $0 mode"
  echo "     mode = 1: RISCV-Size: Run Embench for code size on RISC-V"
  echo "     mode = 2: RISCV-Speed: Run Embench for cycle count on RISC-V"
  echo "     mode = 3: NATIV-Size: Run Emench for code size HOST"
  echo "     mode = 4: NATIVE-Speed: Run Embench for cycle count on HOST"
  exit 2
fi

case $1 in
  "1")
    echo "### RISCV-Size: Run Embench for code size on RISC-V"
    echo "----------------------------------------------"
    echo "benchmark_size.py --absolute"
	$EMBENCH_ROOT/benchmark_size.py --absolute
    ;;
  "2")
    echo "### RISCV-Speed: Run Embench for cycle count on RISC-V ..."
    echo "----------------------------------------------"
    echo "benchmark_speed.py --target-module run_spike --absolute"
	$EMBENCH_ROOT/benchmark_speed.py --target-module run_spike --absolute
    ;;
  "3")
    echo "### NATIVE: Run Embench for code size on HOST"
    echo "----------------------------------------------"
    echo "benchmark_size.py --absolute"
	$EMBENCH_ROOT/benchmark_size.py --absolute
    ;;
  "4")
    echo "### NATIVE: Run Embench for cycle count on HOST"
    echo "----------------------------------------------"
    echo "benchmark_speed.py --target-module run_spike --absolute"
	$EMBENCH_ROOT/benchmark_speed.py --target-module run_native
    ;;

  *)
    echo "Wrong mode. MODE must be one of 1, 2, 3 or 4"
    exit 2;;
esac


