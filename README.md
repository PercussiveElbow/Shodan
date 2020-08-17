# Shodan Crystal

![Main](https://github.com/PercussiveElbow/ShodanCrystalAPI/workflows/Main/badge.svg?branch=master)

Crystal SDK for the Shodan REST API.

# Example usage


```
client = Shodan::Client.new("api_key_here")
host_data = client.host("8.8.8.8")
search_result = client.host_search("Minecraft Server", port: "25565", facets: { country: 1})
```


## Current Shodan API support:

- [X] Shodan Search Methods
- [X] Shodan On-Demand Scanning
- [X] Shodan Directory Methods
- [X] Account Methods
- [X] DNS Methods
- [X] Utility Methods
- [X] API Status Methods
- [X] Experimental
- [ ] Shodan Network Alerts
- [ ] Notifiers


###  Enterprise endpoints (Not implemented)
- [ ] Shodan Bulk Data (Enterprise)
- [ ] Manage Organisation (Enterprise)
- [ ] Internet Scanning (Enterprise/Research)