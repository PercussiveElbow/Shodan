
module Shodan
    struct Domain include JSON::Serializable
        property domain : String?
        property tags : Array(String)?
        property data : Array(DomainData)?
    end

    struct DomainData include JSON::Serializable
        property subdomain : String?
        property type : String? 
        property value : String? 
        property last_seen : String?
    end
end
