#!/bin/bash
if (( $# == 0 )); then
	echo "The file data argument is missing."
	exit
fi
files=(`cat "$1"`)
target="backup-$(date +'%F')"
mkdir ${target}

err=0
for i in "${files[@]}"; do
	if [[ ! -e "$HOME/${i}" ]]; then
		echo "No such file or directory: ${i}"
		(( err++ ))
	fi
done

if (( err > 0 )); then
	echo "One or more files were not found. Exiting..."
	exit
fi

idx=0
for i in "${files[@]}"; do
	cp -r "$HOME/${i}" "$(pwd)/${target}/${idx}"
	(( idx++ ))
done

cp $1 ${target}/filedata

tar -czf ${target}.tar.gz ${target}
rm -r ${target}
