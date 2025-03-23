#!/bin/bash

# Set constants
WORKDIR="/tmp/repo"

# Get env vars
BRANCH_NAME=$(echo $FEATURE_REF | sed 's/refs\/heads\///g')

if [ -z "$API_KEY_ENV_NAME" ] | [ -z "$API_KEY_ENV_VALUE" ]; then
  echo "---------- DEPRECATION WARNING ----------"
  echo "API_KEY_ENV_NAME and/or API_KEY_ENV_VALUE are not set. You are using a deprecated way to set the API key."
  echo "Please set the API key using the api_key_env_name and api_key_env_value action inputs."
  echo "In future versions, using the new method will be required."
  echo "See the README on https://github.com/mirrajabi/aider-github-action for more information."
  echo "------------------------------------------"
else
  export $API_KEY_ENV_NAME=$API_KEY_ENV_VALUE
fi

# Workaround for writing files inside the container
cp -r "${GITHUB_WORKSPACE}" "${WORKDIR}"
# Switch to the repo directory
cd "${WORKDIR}"

# Fix repo ownership issues
git config --global --add safe.directory "${WORKDIR}"

# Set git config (For some reason setting this in the Dockerfile doesn't work!)
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"

# Checkout feature branch
git fetch
git checkout $BRANCH_NAME

# Run aider command
eval "aider --model $MODEL $AIDER_ARGS"

# Push changes
git push -u origin $BRANCH_NAME
