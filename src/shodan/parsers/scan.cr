module Shodan
  struct Scan
    include JSON::Serializable
    property id : String?
    property count : Int64?
    property status : String?
  end

  struct StartScan
    include JSON::Serializable
    property id : String?
    property count : Int64?
    property credits_left : Int64?
  end
end
