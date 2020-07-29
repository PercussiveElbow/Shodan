require "http/client"
require "json"
require "./shodan/*"

module Shodan
    class Client
        def initialize(@api_key : String)

        end

        def host(host_ip : String)
            response = HTTP::Client.get("https://api.shodan.io/shodan/host/#{host_ip}?key=#{@api_key}")
            if response.status_code == 404
                raise ShodanHostNotfoundException.new("Host #{host_ip} not found on Shodan.")
            end
            Client.check_status_code(response.status_code)
            begin
                host_info = Shodan::Host.from_json(response.body)
                return host_info
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def ports()
            response = HTTP::Client.get("https://api.shodan.io/shodan/ports?key=#{@api_key}")
            begin 
                port_listing = Array(Int64).from_json(response.body)
                return port_listing
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end


        ##########################
        #   DIRECTORY  METHODS   # 
        ##########################
        def directory_query()

        end

        def directory_query_serach()

        end

        def directory_query_tags()

        end

        ##########################
        #   ACCOUNT  METHOD      # 
        ##########################
        def account()
            response = HTTP::Client.get("https://api.shodan.io/account/profile?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                account_info = Shodan::Account.from_json(response.body)
                return account_info
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
                api_status = Shodan::APIStatus.from_json(response.body)
                return api_status
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
                headers = Hash(String,String).from_json(response.body)
                return headers
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def my_ip()
            response = HTTP::Client.get("https://api.shodan.io/tools/myip?key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                my_ip_str = String.from_json(response.body)
                return my_ip_str
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
                domain_info = Shodan::Domain.from_json(response.body)
                return domain_info
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def dns_resolve(hostnames : Array(String))
            parsed_hostnames = hostnames.join(",")
            response = HTTP::Client.get("https://api.shodan.io/dns/resolve?hostnames=#{parsed_hostnames}&key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                domain_info = Hash(String,String).from_json(response.body)
                return domain_info
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def dns_reverse(ips : Array(String))
            parsed_ips = ips.join(",")
            response = HTTP::Client.get("https://api.shodan.io/dns/reverse?ips=#{parsed_ips}&key=#{@api_key}")
            Client.check_status_code(response.status_code)
            begin 
                reverse_info = Hash(String,Array(String)).from_json(response.body)
                return reverse_info
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
                honeyscore_value = Int64.from_json(response.body)
                return honeyscore_value
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end

        end

        def self.check_status_code(status_code)
            if status_code != 200
                if status_code == 401
                    raise ShodanAuthorizationException.new("401 response. Likely invalid or expired API key.")
                end
                if status_code == 429
                    raise ShodanRateLimitingException.new("Rate limit exceeded.")
                end
            end
        end

        ## Exceptions
        class ShodanClientException < Exception 
        end
        class ShodanAPIException < Exception 
        end
        class ShodanRateLimitingException < ShodanAPIException
        end
        class ShodanHostNotfoundException < ShodanAPIException
        end
        class ShodanAuthorizationException < ShodanClientException 
        end
    end
end