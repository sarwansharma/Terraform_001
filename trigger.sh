#!/bin/bash

JENKINS_URL="http://agl-jenkins.hpe.com:8888/"
JOB_NAME="vSphere_Autoscaling_Upscale"
USERNAME="root"
API_TOKEN="1167270007e96b4ed169da29c3eae9603b"

java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$API_TOKEN build $JOB_NAME
