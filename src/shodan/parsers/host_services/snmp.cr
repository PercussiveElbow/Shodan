
module Shodan
    struct HostDataSNMP include JSON::Serializable
        property services : String?
        property location : String? 
        property orlastchange : String? 
        property ordesc : String? 
        property orid : String? 
        property contact : String?
        property description : String? 
        property name : String? 
        property uptime : String?
        property objectid : String? 
    end
end