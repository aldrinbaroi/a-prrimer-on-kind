#!/bin/bash
#
# 
#

category=$1
command=$2
shift 1

case $category in
	cluster)
		case $command in
			create) createCluster $@ ;;
			delete) deleteCluster $@ ;;
		esac
		;;
	dashboard)
		case $command in
			setup) setupDashboard $@ ;;
			remove) removeDashbaord $@ ;;
			help) dashboardHelp $@ ;;
		esac
		;;
	proxy)
		case $command in
			start) startProxy ;;
			stop) stopProxy;;
		esac
		;; 
esac


#::END::
