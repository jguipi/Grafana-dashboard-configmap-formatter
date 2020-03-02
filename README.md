# Grafana-dashboard-configmap-formatter

## Description

This script will allow you to convert your Grafana dashboard to configmap so they will be able to be sidecar loaded. 

After the formatting you should create your configmap by command line as follow:

```
kubectl create configmap <your_configmap_name> --from-file=<path_to_your_file>
```

## Usage 

1. Copy the JSON from Grafana -> Export as JSON 

2. Add as many dashboard JSON file in a folder

3. run the following command : `./prepare_dashboard.sh <path_to_exported_json_dashboard_folder>`

* This will format your dashboard to be able to be sidecar loaded in grafana dashboard.

* You might need to restart your pod for those new dashboard to appear

* Example : ./prepare_dashboard.sh ./dashboard_data

### Shout out
This script is inspired by:  https://gist.github.com/aranair/bec788df5a9a292f42e088e481b856c6
