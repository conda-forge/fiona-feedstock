#!/bin/bash

 if [ $(uname) == Darwin ]; then
  brew remove --force $(brew list)
fi

$PYTHON setup.py build_ext -I$PREFIX/include -L$PREFIX/lib -lgdal install --single-version-externally-managed --record record.txt
