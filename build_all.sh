#!/bin/bash

BOXES=$(grep 'vm.define' ../Vagrantfile | cut -d '|' -f2)

mkdir -p out 
vagrant destroy -f

for box in $BOXES
do
	echo
	echo "###############################################"
	echo "Building $box"
	echo "###############################################"
	echo

	mkdir -p out/$box
	rm -f out/$box/$box.box

	vagrant up $box
	vagrant package $box --output out/$box/$box.box
	vagrant destroy -f $box
done
