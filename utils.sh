#!/bin/bash
#
# Utility functions
#

function abort
{
        echo ${1}
        echo "Aborting..."
        echo ""
        exit 1
}

function isClusterExist 
{
	local clusterName=${1}
	local clustersList=($(kind get clusters 2> /dev/null))
	local clustersCount=${#clustersList[@]}
	if [ $clustersCount > 0 ] && [[ " ${clustersList[@]} " =~ " ${clusterName} " ]]; then
		exit 0
	else
		exit 1
	fi 
}

function createDirectory 
{
	local dirName=${1}
	if [ ! -d ${dirName} ]; then
		mkdir -p ${dirName}
		if (( $? )); then
			exit 1
		else
			exit 0
		fi
	fi 
}

#::END::
