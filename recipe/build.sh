#!/bin/bash

if [[ $(uname) == Darwin ]]; then
  export LDFLAGS="-headerpad_max_install_names $LDFLAGS"
fi

$PYTHON -m pip install --no-deps --ignore-installed . \
                       --global-option=build_ext \
                       --global-option="-I$PREFIX/include" \
                       --global-option="-L$PREFIX/lib" \
                       --global-option="-lgdal"