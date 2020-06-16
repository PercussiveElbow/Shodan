require "http/client"
require "json"
require "./shodan/*"

module Shodan
    class Client
        def initialize(@api_key : String)

        end

        def host(host_ip : String)
            response = HTTP::Client.get("https://api.shodan.io/shodan/host/#{host_ip}?key=#{@api_key}")
            Client.check_status_code(response)
            begin
                host_info = Shodan::Host.from_json(response.body)
                return host_info
            rescue ex : JSON::Error
                raise ShodanClientException.new(ex.to_s)
            end
        end

        def self.check_status_code(response)
            if response.status_code != 200
                if response.status_code == 429
                    raise ShodanRateLimitingException.new("Rate limit exceeded.")
                end
                raise ShodanAPIException.new("Non 200 response from host endpoint. #{response.status_code}")
            end
        end

        class ShodanClientException < Exception 
        end
        class ShodanRateLimitingException < Exception
        end
        class ShodanAPIException < Exception 
        end
    end

end