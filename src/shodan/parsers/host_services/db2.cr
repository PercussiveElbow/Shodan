module Shodan
  struct HostDataDB2
    include JSON::Serializable
    property external_name : String?
    property server_platform : String?
    property instance_name : String?
    property db2_version : String?
  end
end
