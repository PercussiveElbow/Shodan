
module Shodan
    struct DirectoryQuery include JSON::Serializable
        property matches : Array(DirectoryQueryMatch)?
        property total : Int64?
    end

    struct DirectoryQueryMatch include JSON::Serializable
        property votes : Int64?
        property description : String?
        property title : String?
        property timestamp : String? 
        property tags : Array(String)?
        property query : String?
    end

    struct DirectoryQueryTags include JSON::Serializable
        property matches : Array(DirectoryQueryTagMatch)?
        property total : Int64?
    end

    struct DirectoryQueryTagMatch include JSON::Serializable
        property value : String?
        property count : Int64?
    end

end