require "http/client"
require "json"
require "./shodan/*"
require "./shodan/parsers/*"

module Shodan
    class Client
        def initialize(@api_key : String)
        end

        ##########################
        #   SEARCH  METHODS      # 
        ##########################
        def host(host_ip : String)
            response = HTTP::Client.get("https://api.shodan.io/shodan/host/#{host_ip}?key=#{@api_key}")
            # puts(response.body)
            if response.status_code == 404
                raise ShodanHostNotfoundException.new("Host #{host_ip} not found on Shodan.")
            end
            Client.check_status_code(response.status_code)
            begin
                return Shodan::Host.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        private def host_search_call(search : Bool, page : Int32, minify : Bool, facets, search_query : String, **query_params)
            if query_params.size() == 0 
                raise ShodanClientException.new("Query string empty")
            else
                query_param_string = search_query.sub(" ","+")
                query_params.each do | key, value |
                    query_param_string += "+#{key}:#{value}"
                end

                if facets && facets.size() > 0
                    facets_string = "&facets=" 
                    facets.each do | key,value | 
                        facets_string += "+#{key}:#{value}"
                    end
                else
                    facets_string = ""
                end
                search_type = search ? "search" : "count"
                response = HTTP::Client.get("https://api.shodan.io/shodan/host/#{search_type}?key=#{@api_key}&query=#{query_param_string}&page=#{page.to_s}&minify=#{minify.to_s}#{facets_string}")
                Client.check_status_code(response.status_code)
                begin 
                    return Shodan::HostSearch.from_json(response.body)
                rescue ex : JSON::Error
                    raise ShodanClientException.new(ex.to_s)
                end   
            end    
        end

        def host_count(search_query, facets = nil, **query_params)
            host_search_call(false, 1, true, facets, search_query, **query_params)
        end

        def host_search(search_query, page : Int32 = 1, minify : Bool = true, facets = nil, **query_params)
            host_search_call(true, page, minify, facets, search_query, **query_params)     
        end

        def filters()
            response = HTTP::Client.get("https://api.shodan.io/shodan/host/search/filters?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Array(String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def facets()
            response = HTTP::Client.get("https://api.shodan.io/shodan/host/search/facets?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Array(String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def tokens()

        end

        def ports()
            response = HTTP::Client.get("https://api.shodan.io/shodan/ports?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Array(Int64).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end
        ##########################
        #   ON DEMAND SCANS      # 
        ##########################

        def protocols()
            response = HTTP::Client.get("https://api.shodan.io/shodan/protocols?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end


        def scan(ips : Array(String))
            ips_to_scan = ips.join(",")

            response = HTTP::Client.post("https://api.shodan.io/shodan/scan?key=#{@api_key}") # todo
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def scan_internet() # Enterprise only
            puts("Not implemented")
        end

        def scan_status(scan_id : String)
            response = HTTP::Client.get("https://api.shodan.io/shodan/scan/#{scan_id}?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end



        ##########################
        #   DIRECTORY  METHODS   # 
        ##########################
        def directory_query()
            response = HTTP::Client.get("https://api.shodan.io/shodan/query?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return DirectoryQuery.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def directory_query_search(query : String, page : Int32 = 10)
            response = HTTP::Client.get("https://api.shodan.io/shodan/query/search?key=#{@api_key}&query=#{query}&page=#{page}")
            Client.check_status_code(response.status_code)
            begin 
                return DirectoryQuery.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def directory_query_tags(size : Int64 = 10)
            response = HTTP::Client.get("https://api.shodan.io/shodan/query/tags?key=#{@api_key}&size=#{size}")
            Client.check_status_code(response.status_code)
            begin 
                return DirectoryQueryTags.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        ##########################
        #   ACCOUNT  METHOD      # 
        ##########################
        def account()
            response = HTTP::Client.get("https://api.shodan.io/account/profile?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Shodan::Account.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        ##########################
        #   API STATUS METHOD    # 
        ##########################
        def api_status()
            response = HTTP::Client.get("https://api.shodan.io/api-info?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Shodan::APIStatus.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        ##########################
        #       TOOLS METHODS    #
        ##########################
        def http_headers()
            response = HTTP::Client.get("https://api.shodan.io/tools/httpheaders?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def my_ip()
            response = HTTP::Client.get("https://api.shodan.io/tools/myip?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return String.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        ##########################
        #       DNS METHODS      #
        ##########################
        def domain(domain : String)
            response = HTTP::Client.get("https://api.shodan.io/dns/domain/#{domain}?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Shodan::Domain.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def dns_resolve(hostnames : Array(String))
            parsed_hostnames = hostnames.join(",")
            response = HTTP::Client.get("https://api.shodan.io/dns/resolve?hostnames=#{parsed_hostnames}&key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,String).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def dns_reverse(ips : Array(String))
            parsed_ips = ips.join(",")
            response = HTTP::Client.get("https://api.shodan.io/dns/reverse?ips=#{parsed_ips}&key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Hash(String,Array(String)?).from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        ##########################
        # EXPERIMENTAL METHODS   #
        ##########################
        def honeyscore(ip : String)
            response = HTTP::Client.get("https://api.shodan.io/labs/honeyscore/#{ip}&key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                return Int64.from_json(response.body)
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def self.check_status_code(status_code)
            if status_code != 200
                raise ShodanAuthorizationException.new("HTTP 401 response. Likely invalid or expired API key.") if status_code == 401
                raise ShodanRateLimitingException.new("HTTP 429 response. Rate limit exceeded.") if status_code == 429
            end
        end
    end
end