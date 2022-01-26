#! /bin/bash

# Build magnetsetup
# pwd
# echo "PREFIX=${PREFIX}"
# ls

echo "PREFIX=${PREFIX}"

python setup.py build
python setup.py install --prefix=$PREFIX
