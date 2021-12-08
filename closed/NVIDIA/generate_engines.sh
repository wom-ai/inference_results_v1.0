#!/bin/bash
source ./settings.sh

echo "##################################################################"
echo "DEVICE=${DEVICE}"
echo "MODEL=${MODEL}"
echo "##################################################################"
echo ""

MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-mobilenet --scenarios=SingleStream"
