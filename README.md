# Shodan Crystal

![Main](https://github.com/PercussiveElbow/ShodanCrystalAPI/workflows/Main/badge.svg?branch=master)

Crystal library for the Shodan [REST API](https://developer.shodan.io/api).


# Installation
Add the library as a dependency within your _shards.yml_
```
dependencies:
  shodan:
      github: percussiveelbow/shodan
```


# Usage
## Setup
```
# Create client object
client = Shodan::Client.new("api_key_here")
```

## Search methods
```
# Lookup data of host
host_data = client.host("1.2.3.4")

# Search hosts
search_result = client.host_search("Minecraft Server", port: "25565", facets: { country: 1})

# Get count of search
host_count = client.host_count("Minecraft Server", port: "25565")

# Get valid search filters
filters = client.filters()

# Get valid search facets
facets = client.facets()

# Get ports Shodan crawlers are looking for
ports = client.ports()
```

## Scan methods
```
# To scan hosts
scan = client.scan(["1.2.3.4","5.6.7.8"])

# To retrieve the result of a scan
scan_result = client.scan("scan_id_here")

# Get valid protocols that can be used to scan
protocols = client.protocols()
```

## Directory methods
```
# To obtain list of search queries users have saved
directory_query_result = client.directory_query()

# Get a list of popular tags for the saved search queries
directory_query__tags_result = client.directory_query_tags()

# To search saved search queries
directory_query_search_results = client.directory_query_search("compromised")
```

## DNS methods
```
# To get DNS data for a domain
domain_result = client.domain("google.com")

# To resolve a domain
resolve_result = client.dns_resolve(["google.com"])

# To reverse search IPs
reverse_result = client.dns_reverse(["1.2.3.4"])
```

## Utility methods
```
# To get your IP
ip = client.my_ip()

# To get your HTTP headers
http_headers = client.http_headers()
```

## Account method
```
# To get account data linked to the API key
account_data = client.account()
```

## API Status
```
# To obtain info about the current API plan
api_info = client.api_status()
```

## Experimental
```
# Get honeyscore result for an IP 
honeyscore_result = client.honeyscore("1.2.3.4")
```

Further details about object models are available in `/docs`



# Current Shodan API support:

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

# License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.