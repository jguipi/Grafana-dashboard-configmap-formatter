#!/bin/bash 
 
# Usage: 
# 1. Copy the JSON from Grafana -> Export as JSON 
# 2. Add as many dashboard JSON file in a folder
# 3. run the following command : ./prepare_dashboard.sh <path_to_exported_json_dashboard_folder>
# - This will format your dashboard to be able to be sidecar loaded in grafana
# Example : ./prepare_dashboard.sh ./dashboard_data

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$#" -ne 1 ]; then
  echo "Usage: ./prepare_dashboard.sh <path_to_exported_json_dashboard_folder>"
  exit
fi

for filename in $1/*.json; do 
  cat "$filename" | \
  jq '.id = null | del(.__requires) | del(.uid) | { dashboard: . , inputs: .__inputs, overwrite: true  }' | \
  jq '.inputs[0].value=.inputs[0].pluginId' | \
  jq 'del(.dashboard.meta) | .dashboard.dashboard.id = null' | \
  jq '.dashboard.dashboard.annotations.list[0].hide = false | del(.inputs) | del(.overwrite) | .dashboard'| \
  tee "$DIR/$filename" 
done


