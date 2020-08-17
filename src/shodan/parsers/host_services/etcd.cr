module Shodan
  struct HostDataETCD
    include JSON::Serializable
    property clientURLs : Array(String)
    property id : String
    property leaderInfo : HostDataETCDLeaderInfo
    property name : String
    property peerURLs : Array(String)
    property recvAppendRequestCnt : Int64
    property recvBandwidthRate : Float64?
    property recvPkgRate : Float64?
    property sendAppendRequestCnt : Int64
    property sendBandwidthRate : Float64?
    property sendPkgRate : Float64?
    property startTime : String
    property state : String
    property version : String
  end

  struct HostDataETCDLeaderInfo
    include JSON::Serializable
    property leader : String
    property startTime : String
    property uptime : String
  end
end
