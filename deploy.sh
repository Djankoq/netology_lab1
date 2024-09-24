#!/bin/bash

# envs
DEV_BRANCH="dev"
PRD_BRANCH="prd"
TAG_PREFIX="release-"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
TAG="${TAG_PREFIX}${TIMESTAMP}"


# change to prd brunch
git checkout ${PRD_BRANCH}

# merge to dev
git merge ${DEV_BRANCH}

# create tag
git tag ${TAG}

# send update
git push origin ${PRD_BRANCH}
git push origin ${TAG}

echo_msg "Success"