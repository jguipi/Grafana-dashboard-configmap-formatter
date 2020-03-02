# Grafana-dashboard-configmap-formatter

## Description

This script will allow you to convert your Grafana dashboard to configmap so they will be able to be sidecar loaded. 

After the formatting you should create your configmap by command line as follow:

```
kubectl create configmap <your_configmap_name> --from-file=<path_to_your_file>
```


### Shout out
This script is inspired by:  https://gist.github.com/aranair/bec788df5a9a292f42e088e481b856c6
