#!/bin/bash
set -x

kaigara render security.groovy > /usr/share/jenkins/ref/init.groovy.d/security.groovy
