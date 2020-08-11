module Shodan
    struct HostDataRsync include JSON::Serializable
        property authentication : Bool 
        property modules : Hash(String,String)
    end
end