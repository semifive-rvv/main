#! /bin/bash

GCC_32BIT_COMP=riscv32-unknown-elf-gcc
GCC_64BIT_COMP=riscv64-unknown-elf-gcc

ARCH32=rv32im
ABI32=ilp32

ARCH64=rv64imafdc
ABI64=lp64d


if [ "$#" -ne 2 ]; then
  echo "Usage: $0 target <C source codes>"
  echo "     target = 1 for 32-bit code generation"
  echo "     target = 2 for 64-bit code generation"
  exit 2
else
  name=`echo $2 | sed 's/\.c//g'`

  case $1 in
    "1") 
	  echo "### 32-bit code generation ..."
	  echo "### Clearing previous results ..."
	  rm ${name}_32.out

	  echo "### Running riscv32-unknown-elf-gcc -march=${ARCH32} -mabi=${ABI32} -o ${name}_32.out $2"
	  ${GCC_32BIT_COMP} -march=${ARCH32} -mabi=${ABI32} -o ${name}_32.out $2
	  ;;

	"2")
	  echo "### 64-bit code generation ..."
	  echo "### Clearing previous results ..."
	  rm ${name}_64.out

	  echo "### Running riscv64-unknown-elf-gcc -march=${ABI64} -mabi=${ABI64} -o ${name}_64.out $2"
	  ${GCC_64BIT_COMP} -march=${ARCH64} -mabi=${ABI64} -o ${name}_64.out $2
	  ;;

	*)
	  echo "Wrong target. target must be 1 for 32-bit code generation and 2 for 64-bit code generation"
	  exit 2;;
  esac

fi
