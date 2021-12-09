#!/bin/bash
source ./settings.sh

echo "##################################################################"
echo "DEVICE=${DEVICE}"
echo "MODEL=${MODEL}"
echo "##################################################################"
echo ""

DATETIME=$(date '+%Y%m%d_%H%M%S');
mkdir -p ./logs/${DEVICE}

start=`date +%s`
cp -vf ./build/engines/${DEVICE}/ssd-mobilenet/SingleStream/ssd-mobilenet-${MODEL}-SingleStreamB1-gpu-b1-int8.default.plan ./build/engines/${DEVICE}/ssd-mobilenet/SingleStream/ssd-mobilenet-SingleStream-gpu-b1-int8.default.plan && \
make run_harness RUN_ARGS="--benchmarks=ssd-mobilenet --scenarios=SingleStream --config_ver=default,high_accuracy --test_mode=PerformanceOnly" 2>&1 | tee ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log
end=`date +%s`
runtime=$((end-start))
echo "Elapsed Time: $runtime seconds"
echo "Elapsed Time: $runtime seconds" >> ./logs/${DEVICE}/${MODEL}_B1_${DATETIME}.log

make run_harness RUN_ARGS="--benchmarks=ssd-mobilenet --scenarios=SingleStream --config_ver=default,high_accuracy --test_mode=AccuracyOnly" 2>&1 | tee ./logs/${DEVICE}/${MODEL}_AC_${DATETIME}.log
