#!/bin/bash

set -x
set -e

if [ -z "$KETTLE_HOME" ]; then
        echo "KETTLE_HOME is not set"
        exit 1
fi

if [ -z "$KETTLE_JOBS" ]; then
        echo "KETTLE_JOBS is not set"
        exit 1
fi

# $KETTLE_HOME should have been set by the caller
export KETTLE_HOME

# Should define GPL_ID, ANNOTATION_TITLE
source $1

$KITCHEN -norep=Y						\
-file="$KETTLE_JOBS/load_QPCR_MIRNA_annotation.kjb"		\
-log="load_mirna_annotation_$(date +"%Y%m%d%H%M").log"		\
-param:DATA_LOCATION="$DATA_LOCATION"				\
-param:SORT_DIR=/tmp						\
-param:GPL_ID="$GPL_ID"						\
-param:LOAD_TYPE=I						\
-param:ANNOTATION_TITLE="$GPL_ID"				\
-param:MIRNA_TYPE="$MIRNA_TYPE"
