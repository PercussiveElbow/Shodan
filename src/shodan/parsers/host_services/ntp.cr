module Shodan
  struct HostDataNTP
    include JSON::Serializable
    property monlist : Hash(String, String)

    @[JSON::Field(key: "system")]
    property system : String?

    property version : Hash(String, String)

    property clock : String?
    property refid : String
    property state : Int64
    property clock_offset : Float64
    property delay : Float64
    property mintc : Int64?
    property tc : Int64?
    property peer : Int64?
    property processor : String?
    property frequency : Hash(String, String)?
    property jitter : Float64?
    property sys_jitter : Hash(String, String)?
    property clk_jitter : Hash(String, String)?
    property clk_wander : Hash(String, String)?
    property phase : Hash(String, String)?
    property leap : Int64
    property noise : Float64
    property offset : Hash(String, String)?
    property poll : Int64
    property precision : Int64
    property reftime : Hash(String, String)?
    property root_delay : Float64?
    property rootdelay : Hash(String, String)
    property rootdisp : Hash(String, String)?
    property stability : Float64?
    property stratum : Int64?
  end
end
