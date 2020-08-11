module Shodan
    struct HostDataEthernetIP include JSON::Serializable
        property command : Int64 
        property command_length : Int64
        property command_status : Int64
        property device_type : String
        property encapsulation_length : Int64
        property ip : String 
        property item_count : Int64
        property options : Int64
        property product_code : Int64
        property product_name : String 
        property product_name_length : Int64
        property raw : String 
        property revision_major : Int64
        property revision_minor : Int64 
        property sender_context : String 
        property serial : Int64
        property session : Int64
        property socket_addr : String 
        property state : Int64 
        property status : Int64
        property type_id : Int64 
        property vendor_id : String
        property version : Int64 
    end
end