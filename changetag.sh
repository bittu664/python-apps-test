#!/bin/bash
sed "s/tagVersion/$1/g" /python-helm-apps/values.yaml > /python-helm-apps/values.yaml
