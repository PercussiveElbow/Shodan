module Shodan
  struct HostDataSMB
    include JSON::Serializable
    property features : Hash(String, Hash(String, Array(String)))?
    property anonymous : Bool?
    property os : String?
    property raw : Array(String)?
    property shares : Array(String)?
    property smb_version : Int64
    property software : String?
    property capabilities : Array(String)?
  end
end
