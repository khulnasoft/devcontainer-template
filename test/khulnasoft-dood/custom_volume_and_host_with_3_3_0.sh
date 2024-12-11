#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

khulnasoft wait -t 30

# Scenario specific tests
check "khulnasoft-cli version" 'khulnasoft --version | grep 3.3.0'
check "khulnasoft custom host reachable" curl -s http://my-host.khulnasoft.com:4566/_khulnasoft/health
check "khulnasoft image version" "curl -s http://my-host.khulnasoft.com:4566/_khulnasoft/health | jq -e '.version | test(\"^3.3.[0-9].dev.*\")'"

# Report result
reportResults
