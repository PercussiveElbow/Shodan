require "./host/*"

module Shodan
    struct Host include JSON::Serializable
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

        struct HostData include JSON::Serializable
            # ip and isp
            property ip : String?
            property ip_str : String?
            property isp : String?
            property asn : String? 
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
            # extra deets
            property location : HostDataLocation?
            property http : HostDataHTTP?
            property ssl : HostDataSSL? 
        end

        struct HostDataLocation include JSON::Serializable # not sure why shodan duplicates this
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