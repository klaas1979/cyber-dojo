#!/bin/bash

# Run a local server using docker to process [test] events

export CYBER_DOJO_RUNNER_CLASS=DockerRunner
rails s
unset CYBER_DOJO_RUNNER_CLASS