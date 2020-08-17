module Shodan
  struct HostDataInfluxDB
    include JSON::Serializable
    property uptime : String
    property go_max_procs : Int64
    property go_version : String
    property go_os : String
    property go_arch : String
    property network_hostname : String
    property version : String
    property bind_address : String
    property build : String
    property databases : Array(String)
  end
end
