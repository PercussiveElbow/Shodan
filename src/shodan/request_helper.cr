require "json"
require "http"

class RequestHelper
    BASE_URL = "https://api.shodan.io/"

    def initialize(api_key : String)
        @api_key = api_key
    end

    def get_req(endpoint,query="",facets="",extra_params = {} of String => String)
        param_string = handle_params(query,facets,extra_params)
        url = BASE_URL + endpoint + "?key=#{@api_key}#{param_string}"
        
        puts()
        puts("Requesting #{url}")
        response = HTTP::Client.get(url)
        check_valid_response(response)
        JSON.parse(response.body)
    end
    
    def post_req(endpoint)
        url = BASE_URL + endpoint + "?key=#{@api_key}"
    end

    def check_valid_response(response)
        if response.status_code == 401
            raise InvalidAPIKeyException.new("API key invalid. Recieved 401 response from Shodan.")
        end

        #puts("Error key found in JSON") if JSON.parse(response.body).has_key?("error")
        puts("I should throw an exception here") if response.status_code != 200
    end

    def handle_params(query, facets, extra_params = {} of String => String)
        param_string = ""
        param_string = "&query=#{query}" if query.size() > 0
        param_string = "#{param_string}&facets=#{facets}" if facets.size > 0
        
        if extra_params.size() > 0
            extra_params.each do |k,v|
                param_string = "#{param_string}&#{k}=#{v}"
            end
        end
        param_string
    end

    class InvalidAPIKeyException < Exception
    end

end