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
	clustersList=($(kind get clusters 2> /dev/null))
	clustersCount=${#clustersList[@]}
	if [ $clustersCount > 0 ] && [[ " ${clustersList[@]} " =~ " ${clusterName} " ]]; then
		exit 0
	else
		exit 1
	fi 
}

#::END::
