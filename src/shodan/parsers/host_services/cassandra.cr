module Shodan
  struct HostDataCassandra
    include JSON::Serializable
    property name : String?
    property keyspaces : Array(String)?
    property partitioner : String?
    property snitch : String?
  end
end
