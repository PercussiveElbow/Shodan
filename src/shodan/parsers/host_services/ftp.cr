module Shodan
    struct HostDataFTP include JSON::Serializable
        property features : Hash(String,Hash(String,Array(String)))?
        property anonymous : Bool?
    end
end