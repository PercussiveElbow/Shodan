module Shodan
  struct Account
    include JSON::Serializable
    property member : Bool?
    property credits : Int64?
    property display_name : String?
    property created : String?
  end
end
