require "./shodan/request_helper.cr"

class Shodan

  def initialize(api_key :  String)
    api_key
    @base = RequestHelper.new(api_key) 
  end

  ### Search Methods 
  def host(ip,params={} of String => String)
    @base.get_req("shodan/host/#{ip}", extra_params: params)
  end

  def count(query,facets="")
    @base.get_req("shodan/host/count",query: query, facets: facets)
  end

  def search(query,facets="",params ={} of String => String)
    @base.get_req("shodan/host/search",query: query,facets: facets, extra_params: params)
  end

  def tokens(query)
    @base.get_req("shodan/host/search/tokens",query: query)
  end

  def ports
    @base.get_req("shodan/ports")
  end

  ### On Demand Scanning Methods
  def protocols
    @base.get_req("shodan/protocols")
  end


  ### Network Alerts


  ### Directory methods


  ### Bulk Data (Not implemented as enterprise only)
  ### Manage Org (Not implemented as enterprise only)

  ### DNS Methods
  def dns_domain(domain)
    @base.get_req("dns/domain/#{domain}")
  end

  def dns_resolve(host_names)
    @base.get_req("dns/resolve",extra_params:  {"hostnames" => host_names})
  end

  def dns_reverse(ips)
    @base.get_req("dns/reverse",extra_params:  {"ips" => ips})
  end

  ### Utility
  def http_headers
    @base.get_req("tools/httpheaders")
  end

  def myip
    @base.get_req("tools/myip")
  end

  ### Status
  def info
    @base.get_req("api-info")
  end

  ## Experimental 
  def honeyscore(ip)
    @base.get_req("labs/honeyscore/#{ip}")
  end

end

# shodan = Shodan.new("")

shodan = Shodan.new("a")

puts("Search methods")
puts(shodan.host("8.8.8.8"))
puts(shodan.host("8.8.8.8", params:  { "history" => false,"minify" => false}))
puts(shodan.search("http.title:\"hacked by\""))
puts(shodan.count("apache"))
puts(shodan.count("apache",facets: "org: 5"))
puts(shodan.ports())

puts()
puts("DNS")
# puts(shodan.dns_domain("google.com"))
# puts(shodan.dns_resolve("google.com"))
# puts(shodan.dns_reverse("8.8.8.8"))

# puts()
# puts("Utility")
# puts(shodan.http_headers)
# puts(shodan.myip)

# puts()
# puts("Status")
# puts(shodan.info())

# puts()
# puts("Experimental")
# puts(shodan.honeyscore("8.8.8.8"))