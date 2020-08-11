module Shodan
    struct HostDataLANTronix include JSON::Serializable
        property gateway : String?
        property ip : String?
        property mac : String?
        property password : String?
        property type : String? 
        property version : String?
    end
end