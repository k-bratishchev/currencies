#!/bin/bash

set -e

# Dev org alias should not be empty
if [ -z "$1" ]
then
    echo "You should pass scratch org alias as the first param"
    exit 0
fi

ORG_ALIAS=$1
ORG_NAME="CT Scratch $1"

# Update SFDX Cli
sfdx update

# By default org's lifetime equals 30 days
sfdx force:org:create orgName="$ORG_NAME" -f config/project-scratch-def.json -s -a $ORG_ALIAS -d 30 --loglevel error

# Deploy metadata and settings, configure org
sfdx force:source:push -u $ORG_ALIAS

sfdx force:apex:execute -f scripts/SetScheduler.apex -u $ORG_ALIAS

sfdx force:org:open -u $ORG_ALIAS
