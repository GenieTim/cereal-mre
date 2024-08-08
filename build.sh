#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

mkdir -p build
cd build || exit 2

if [ -z "$CC" ] || [ -z "$CXX" ]; then
  if [[ $OSTYPE == 'darwin'* ]]; then
    CXXCOMPILER=$(which clang++ || which g++)
    CCOMPILER=$(which clang || which gcc)
  else
    CXXCOMPILER=$(which g++ || which clang++)
    CCOMPILER=$(which gcc || which clang)
  fi
else
  CXXCOMPILER=$CXX
  CCOMPILER=$CC
fi

ADDITIONALFLAGS=("${ADDITIONALFLAGS[@]}" -D CMAKE_C_COMPILER="$CCOMPILER" -D CMAKE_CXX_COMPILER="$CXXCOMPILER")

if command -v ninja; then
  ADDITIONALFLAGS=("${ADDITIONALFLAGS[@]}" "-GNinja")
  GENERATOR_BIN="ninja"
fi

cmake .. "${ADDITIONALFLAGS[@]}" || exit 1
cmake --build . || exit 4
