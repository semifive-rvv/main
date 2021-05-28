#! /bin/bash 

# Native compilation: ./build_all.py --arch native --board default --chip default --clean

EMBENCH_ROOT=$PWD

if [ "$#" -ne 1 ]; then
  echo "Compiling Embench "
  echo "Usage: $0 mode"
  echo "     mode = 1: RISCV: Clearing previous results and compiling embebch"
  echo "     mode = 2: RISCV: Just compiling embench"
  echo "     mode = 3: NATIVE: Clearing previous results and compiling embebch"
  echo "     mode = 4: NATIVE: Just compiling embench"
  echo "     mode = 5: RISCV : SEMIFICVE env."
  exit 2
fi


case $1 in
  "1")
    echo "### RISCV: Clearing previous results and compiling embench..."
    echo "----------------------------------------------"
    echo ""
	$EMBENCH_ROOT/build_all.py --arch riscv32 --chip generic --board spike --cc $RISCV_PATH/bin/riscv32-unknown-elf-gcc --clean --verbose
    ;;
  "2")
    echo "### RISCV: Compiling embench ..."
    echo "----------------------------------------------"
    echo ""
	echo "### RISCV: Run build_all.py ..."
	$EMBENCH_ROOT/build_all.py --arch riscv32 --chip generic --board spike --cc $RISCV_PATH/bin/riscv32-unknown-elf-gcc --verbose
    ;;
  "3")
    echo "### NATIVE: Clearing previous results and compiling embench..."
    echo "----------------------------------------------"
    echo ""
	$EMBENCH_ROOT/build_all.py --arch native --board default --chip default --clean --verbose
    ;;
  "4")
    echo "### NATIVE: Compiling embench ..."
    echo "----------------------------------------------"
    echo ""
	echo "### NATIVE: Run build_all.py ..."
	$EMBENCH_ROOT/build_all.py --arch native --board default --chip default --verbose
    ;;
  "5")
    echo "### RISCV: Clearing previous results and compiling embench..."
    echo "----------------------------------------------"
    echo ""
	$EMBENCH_ROOT/build_all.py --arch riscv32 --chip generic --board spike --cc $RISCV_PATH/bin/riscv32-unknown-elf-gcc  --verbose --clean \
        --cflags "-march=rv32imc -mabi=ilp32" 
    ;;

  *)
    echo "Wrong mode. MODE must be one of 1, 2, 3, 4 or 5"
    exit 2;;
esac

