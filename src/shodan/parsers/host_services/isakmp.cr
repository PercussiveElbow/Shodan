module Shodan
    struct HostDataISAKMP include JSON::Serializable
        property flags : HostDataISAKMPFlags?
        property aggressive : HostDataISAKMPAggressive?
        property exchange_type : Int64 
        property initiator_spi : String 
        property length : Int64 
        property msg_id : String 
        property next_payload : Int64 
        property responder_spi : String 
        property vendor_ids : Array(String)
        property version : String 
    end

    struct HostDataISAKMPFlags include JSON::Serializable
        property authentication : Bool 
        property commit : Bool 
        property encryption : Bool
    end

    struct HostDataISAKMPAggressive include JSON::Serializable
        property initiator_spi : String? 
        property responder_spi : String? 
        property msg_id : String? 
        property next_payload : Int64? 
        property exchange_type : Int64? 
        property length : Float64? 
        property version : String? 
        property vendor_ids : Array(String)
        property flags : HostDataISAKMPFlags?
    end
end