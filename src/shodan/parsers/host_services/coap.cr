module Shodan
  struct HostDataCoAP
    include JSON::Serializable
    property resources : Hash(String, Hash(String, String))?
  end
end
