module Shodan
  struct APIStatus
    include JSON::Serializable
    property query_credits : Int64?
    property scan_credits : Int64?
    property telnet : Bool?
    property usage_limits : UsageLimits?
    property https : Bool?
    property unlocked : Bool?
    property plan : String?
  end

  struct UsageLimits
    include JSON::Serializable
    property scan_credits : Int64?
    property query_credits : Int64?
    property monitored_ips : Int64?
  end
end
