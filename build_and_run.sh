#!/usr/bin/env bash
# build-and-run.sh — Rebuild mqttuv from scratch and launch it
# Usage: ./build-and-run.sh [build-dir]

set -euo pipefail

BUILD_DIR=${1:-build}      # default “build”, or let caller override

echo "➜ Cleaning previous build directory: $BUILD_DIR"
rm -rf "$BUILD_DIR"        # delete dir and its contents if it exists

echo "➜ Configuring CMake"
mkdir -p "$BUILD_DIR"
cd        "$BUILD_DIR"
cmake ..

echo "➜ Compiling"
make -j"$(nproc)"

echo "➜ Running broker"
./mqttuv -c ../sol/sol.conf