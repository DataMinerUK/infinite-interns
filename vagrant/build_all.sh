#!/bin/bash

BOXES=$(grep 'vm.define' ../Vagrantfile | cut -d '|' -f2)

mkdir -p boxes
vagrant destroy -f

for box in $BOXES
do
	echo
    echo "###############################################"
	echo "Building $box"
	echo "###############################################"
	echo

	vagrant up $box
	rm -f boxes/$box.box
	vagrant package $box --output boxes/$box.box
	vagrant destroy -f $box
done