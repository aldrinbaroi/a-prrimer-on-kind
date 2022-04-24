#!/bin/bash
#
# 
#

category=$1
command=$2
shift 2

case $category in
	cluster)
		case $command in
			create) createCluster $@ ;;
			delete) deleteCluster $@ ;;
			help) clusterHelp ;;
		esac
		;;
	dashboard)
		case $command in
			setup) setupDashboard $@ ;;
			remove) removeDashboard $@ ;;
			help) dashboardHelp ;;
		esac
		;;
	proxy)
		case $command in
			start) startProxy ;;
			stop) stopProxy ;;
			help) proxyHelp ;;
		esac
		;; 
esac


#::END::
