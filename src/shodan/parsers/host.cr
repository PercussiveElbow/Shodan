require "./host_services/*"

module Shodan
  struct HostSearch
    include ::JSON::Serializable
    property matches : Array(Shodan::Host::HostData)?
    property total : Int64?
    property facets : Hash(String, Array(HostSearchFacet))?
  end

  struct HostSearchFacet
    include ::JSON::Serializable
    property count : Int64?
    property value : String?
  end

  struct Host
    include JSON::Serializable
    # ip isp asn
    property ip : Int64?
    property ip_str : String?
    # loc info
    property country_code : String?
    property region_code : String?
    property area_code : String?
    property postal_code : String?
    property city : String?
    property country_name : String?
    property dma_code : Int32?
    property longitude : Float64?
    property latitude : Float64?
    # hostnames
    property hostnames : Array(String)?
    property domains : Array(String)?
    # timestamp
    property last_update : String?
    # os and open ports
    property os : String?
    property ports : Array(Int32)
    property org : String?
    # data
    property data : Array(HostData)?
    # shodan tags
    property tags : Array(String)?

    struct HostData
      include JSON::Serializable
      # ip and isp
      property ip : Int64?
      property ip_str : String?
      property isp : String?
      property asn : String?
      property org : String?
      # hostnames and domain
      property hostnames : Array(String)?
      property domains : Array(String)?
      # product identification
      property os : String?
      property banner : String?
      property version : String?
      property cpe : Array(String)?
      property product : String?
      property port : Int32?
      property info : String?
      property hash : Int64?
      property transport : String?
      # timestamp again
      property timestamp : String?
      property data : String?

      property location : HostDataLocation?

      # Each possible service
      property cassandra : HostDataCassandra?
      property coap : HostDataCoAP?
      property db2 : HostDataDB2?
      property docker : HostDataDocker?
      property dns : HostDataDNS?
      property elastic : HostDataElastic?
      property etcd : HostDataETCD?
      property ethernetip : HostDataEthernetIP?
      property ftp : HostDataFTP?
      property hive : HostDataHive?
      property http : HostDataHTTP?
      property influxdb : HostDataInfluxDB?
      property isakmp : HostDataISAKMP?
      property lantronix : HostDataLANTronix?
      property minecraft : HostDataMinecraft?
      property monero : HostDataMonero?
      property mongodb : HostDataMongoDB?
      property mqtt : HostDataMQTT?
      property ntp : HostDataNTP?
      property netbios : HostDataNetBIOS?
      property redis : HostDataRedis?
      property rsync : HostDataRsync?
      property rip : HostDataRIP?
      property ssh : HostDataSSH?
      property smb : HostDataSMB?
      property snmp : HostDataSNMP?
      property ssl : HostDataSSL?
      property vertx : HostDataVertx?
    end

    struct HostDataLocation
      include JSON::Serializable # not sure why shodan duplicates this
      property city : String?
      property region_code : String?
      property area_code : String?
      property longitude : Float64?
      property latitude : Float64?
      property country_code3 : String?
      property country_name : String?
      property postal_code : String?
      property dma_code : Int32?
      property country_code : String?
    end
  end
end
