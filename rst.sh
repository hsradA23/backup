#!/bin/bash
if (( $# == 0 )); then
	echo "The backup archive is missing."
	exit
fi

target=$1

tar -xf ${target}
target="${target%%.*}"
chown -R ${USER} ${target}
files=(`cat "${target}/filedata"`)

idx=0
for i in "${files[@]}"; do
	mkdir -p "${HOME}/$(dirname "${i}")"
	cp -r "${target}/${idx}" "${HOME}/${i}"
	(( idx++ ))
done

rm -r ${target}
