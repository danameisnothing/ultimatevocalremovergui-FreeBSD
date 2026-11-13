#!/bin/sh

# This fork was never intended to work again for upstream (e.g. this could fail on Linux anytime)
# https://stackoverflow.com/a/28776100
if [ $(id -u) -ne 0 ]; then
    echo "this script requires root permissions to install system Python packages, exiting..."
    exit 1
fi

# For requirements.txt :
# latest versions grabbed from https://pypi.org/project/<Package Name>/
# Ommited packages :
#onnxruntime-gpu, idk
#onnx2pytorch, idk
#Dora==0.0.3, doesn't seem to be used?

while read package; do
    pip install "$package"
done < requirements.txt

pkg install py312-numpy py312-cryptography py312-librosa py312-opencv-python-headless py312-pytorch-lightning py312-scipy py312-pytorch py312-samplerate py312-onnx py312-onnxruntime
# just in case
pkg install math/py-statsmodels devel/py-xarray

# https://stackoverflow.com/questions/30492148/how-do-you-install-python-package-without-dependencies
pip install -v --no-deps onnx2pytorch