#!/bin/bash

pushd ~/Music > /dev/null 2>&1

if [[ ! -d Tags ]]; then
    mkdir Tags
fi

function tag() {
    if [[ ! -d Tags/$1 ]]; then
        mkdir Tags/$1
    fi

    find -P . -name "*$2*" -not -path "*/Tags/*" -print0 |\
        xargs -i -0 basename -z {} |\
        xargs -0 -p -t -i ln -s $(pwd)/{} ~/Music/Tags/$1/{}
}

tag $1 $2

popd > /dev/null 2>&1
