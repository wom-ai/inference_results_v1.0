#!/bin/bash
source ./settings.sh

echo "##################################################################"
echo "DEVICE=${DEVICE}"
echo "MODEL=${MODEL}"
echo "##################################################################"
echo ""

MODEL=${MODEL} make generate_engines RUN_ARGS="--benchmarks=ssd-mobilenet --scenarios=SingleStream" && \
mv ./build/engines/${DEVICE}/ssd-mobilenet/SingleStream/ssd-mobilenet-SingleStream-gpu-b1-int8.default.plan ./build/engines/${DEVICE}/ssd-mobilenet/SingleStream/ssd-mobilenet-${MODEL}-SingleStreamB1-gpu-b1-int8.default.plan
