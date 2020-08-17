module Shodan
  struct HostDataRIP
    include JSON::Serializable
    property addresses : Array(HostDataRIPAddress)
    property command : Int64
    property version : Int64
  end

  struct HostDataRIPAddress
    include JSON::Serializable
    property addr : String
    property family : String?
    property metric : Int64
    property next_hop : String?
    property subnet : String?
    property tag : Int64?
  end
end
