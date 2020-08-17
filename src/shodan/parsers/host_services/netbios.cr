module Shodan
  struct HostDataNetBIOS
    include JSON::Serializable
    property mac : String
    property names : Array(HostDataNetBIOSName)
    property raw : Array(String)
    property networks : Array(String)
    property servername : String
    property username : String?
  end

  struct HostDataNetBIOSName
    include JSON::Serializable
    property flags : Int64
    property name : String
    property suffix : Int64
  end
end
