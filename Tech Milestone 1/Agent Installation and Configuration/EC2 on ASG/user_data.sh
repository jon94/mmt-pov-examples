#!/bin/bash

export DATADOG_API_KEY=XXXXXXX
export DD_ENV=<set the env here>
export DD_SERVICE=<set service here>

DD_API_KEY=$DATADOG_API_KEY \
bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"

sudo -u dd-agent -g dd-agent touch /etc/datadog-agent/environment
sudo chown $(whoami) /etc/datadog-agent/environment
cat <<EOT > /etc/datadog-agent/environment
DD_SERVICE=$DD_SERVICE 
DD_ENV=$DD_ENV 
DD_APM_ENABLED=true 
DD_APM_NON_LOCAL_TRAFFIC=true 
EOT
sudo chown dd-agent /etc/datadog-agent/environment

sudo chown $(whoami) /etc/datadog-agent/datadog.yaml
sudo cat <<EOT > /etc/datadog-agent/datadog.yaml
api_key: $DATADOG_API_KEY
tags:
  - "service_name:asg-test"
process_config:
  process_collection:
    enabled: true
EOT
sudo chown dd-agent /etc/datadog-agent/datadog.yaml

# Restart the Datadog Agent
sudo systemctl restart datadog-agent

# Get Datadog Agent Status
sudo systemctl status datadog-agent