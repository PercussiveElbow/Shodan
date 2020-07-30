module Shodan
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