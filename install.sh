#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# fish
ln -s ${BASEDIR}/fish/conf.d/ ~/.config/fish/conf.d
ln -s ${BASEDIR}/fish/functions/ ~/.config/fish/functions
ln -s ${BASEDIR}/fish/src/ ~/.config/fish/src
