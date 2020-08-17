module Shodan
  struct HostDataSSH
    include JSON::Serializable
    property cipher : String?
    property fingerprint : String?
    property type : String?
    property key : String?
    property mac : String?
    property keyx : HostDataSSHKex?
    property hassh : String?

    struct HostDataSSHKex
      include JSON::Serializable
      property compression_algorithms : Array(String)?
      property encryption_algorithms : Array(String)?
      property kex_algorithms : Array(String)?
      property kex_follows : Bool?
      property languages : Array(String)?
      property mac_algorithms : Array(String)?
      property server_host_key_algorithms : Array(String)?
      property unused : Int64?
    end
  end
end
