#!/bin/bash
# Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source code/common/file_downloads.sh

MODEL=3d-unet

download_file models ${MODEL} https://zenodo.org/record/3928973/files/224_224_160_dyanmic_bs.onnx?download=1 3dUNetBraTS.onnx
download_file models ${MODEL} https://zenodo.org/record/3904106/files/fold_1.zip?download=1 fold_1.zip \
    && unzip -d ${MLPERF_SCRATCH_PATH}/models/3d-unet ${MLPERF_SCRATCH_PATH}/models/3d-unet/fold_1.zip
