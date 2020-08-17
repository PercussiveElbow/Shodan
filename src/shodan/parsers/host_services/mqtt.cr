module Shodan
  struct HostDataMQTT
    include JSON::Serializable
    property code : Int64
    property messages : Array(HostDataNetMQTTMessage)
  end

  struct HostDataNetMQTTMessage
    include JSON::Serializable
    property payload : String
    property topic : String
  end
end
