#!/bin/bash

if [[ $(uname) == Darwin ]]; then
  export LDFLAGS="-headerpad_max_install_names $LDFLAGS"
  export LANG=en_US.UTF-8
fi

$PYTHON setup.py build_ext -I$PREFIX/include -L$PREFIX/lib -lgdal \
                 install --single-version-externally-managed --record record.txt
