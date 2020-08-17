module Shodan
  struct HostDataHive
    include JSON::Serializable
    property databases : Array(HostDataHiveDatabase)
  end

  struct HostDataHiveDatabase
    include JSON::Serializable
    property name : String
    property tables : Array(HostDataHiveTable)
  end

  struct HostDataHiveTable
    include JSON::Serializable
    property name : String
    property properties : Array(Hash(String, String))
  end
end
