module Shodan
  struct HostDataDNS
    include JSON::Serializable
    property resolver_hostname : String?
    property recursive : Bool?
    property resolver_id : String?
    property software : String?
  end
end
