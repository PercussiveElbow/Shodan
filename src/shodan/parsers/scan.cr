
module Shodan
    struct Scan include JSON::Serializable
        property id : String?
        property count : Int64?
        property status : String?
    end
end