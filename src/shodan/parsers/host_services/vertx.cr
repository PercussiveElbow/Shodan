module Shodan
  struct HostDataVertx
    include JSON::Serializable
    property firmware_data : String
    property firmware_version : String
    property internal_ip : String
    property mac : String
    property name : String
    property type : String
  end
end
