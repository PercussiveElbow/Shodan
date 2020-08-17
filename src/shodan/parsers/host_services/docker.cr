module Shodan
  struct HostDataDocker
    include JSON::Serializable
    @[JSON::Field(key: "ApiVersion")]
    property apiversion : String?

    @[JSON::Field(key: "Arch")]
    property arch : String?

    @[JSON::Field(key: "BuildTime")]
    property buildtime : String?

    @[JSON::Field(key: "Components")]
    property components : Array(HostDataDockerComponent)?

    @[JSON::Field(key: "Containers")]
    property containers : Array(HostDataDockerContainer)?

    @[JSON::Field(key: "Engine")]
    property engine : String?

    @[JSON::Field(key: "Experimental")]
    property experimental : Bool?

    @[JSON::Field(key: "GitCommit")]
    property gitcommit : String?

    @[JSON::Field(key: "GoVersion")]
    property goversion : String?

    @[JSON::Field(key: "KernelVersion")]
    property kernelversion : String?

    @[JSON::Field(key: "MinAPIVersion")]
    property minapiversion : String?

    @[JSON::Field(key: "EulerVersion")]
    property eulerversion : String?

    @[JSON::Field(key: "Os")]
    property os : String?

    @[JSON::Field(key: "PkgVersion")]
    property pkgversion : String?

    @[JSON::Field(key: "Platform")]
    property platform : HostDataDockerPlatform?

    @[JSON::Field(key: "Version")]
    property version : String?

    struct HostDataDockerComponent
      include JSON::Serializable
      @[JSON::Field(key: "Name")]
      property name : String?

      @[JSON::Field(key: "Version")]
      property version : String?

      @[JSON::Field(key: "Details")]
      property details : HostDataDockerComponentDetails?

      struct HostDataDockerComponentDetails
        include JSON::Serializable
        @[JSON::Field(key: "ApiVersion")]
        property apiversion : String?

        @[JSON::Field(key: "Arch")]
        property arch : String?

        @[JSON::Field(key: "BuildTime")]
        property buildtime : String?

        @[JSON::Field(key: "Experimental")]
        property experimental : String?

        @[JSON::Field(key: "GitCommit")]
        property gitcommit : String?

        @[JSON::Field(key: "GoVersion")]
        property goversion : String?

        @[JSON::Field(key: "KernelVersion")]
        property kernelversion : String?

        @[JSON::Field(key: "MinAPIVersion")]
        property minapiversion : String?

        @[JSON::Field(key: "Os")]
        property os : String?
      end
    end

    struct HostDataDockerContainer
      include JSON::Serializable
      @[JSON::Field(key: "Command")]
      property command : String?

      @[JSON::Field(key: "Created")]
      property created : Int64?

      @[JSON::Field(key: "FinishedAt")]
      property finishedat : Int64?

      @[JSON::Field(key: "HostConfig")]
      property hostconfig : HostDataDockerContainerConfig?

      @[JSON::Field(key: "Id")]
      property id : String?

      @[JSON::Field(key: "Image")]
      property image : String?

      @[JSON::Field(key: "ImageID")]
      property imageid : String?

      @[JSON::Field(key: "Labels")]
      property labels : Hash(String, Hash(String, Array(String)))?

      @[JSON::Field(key: "Mounts")]
      property mounts : Array(HostDataDockerContainerMounts)?

      @[JSON::Field(key: "Names")]
      property names : Array(String)?

      @[JSON::Field(key: "NetworkSettings")]
      property networksettings : HostDataDockerContainerNetworkSettings?

      @[JSON::Field(key: "Ports")]
      property ports : Array(HostDataDockerContainerPorts)?

      @[JSON::Field(key: "StartedAt")]
      property startedat : Int64?

      @[JSON::Field(key: "State")]
      property state : String?

      @[JSON::Field(key: "Status")]
      property status : String?

      struct HostDataDockerContainerConfig
        include JSON::Serializable
        @[JSON::Field(key: "NetworkMode")]
        property networkmode : String?
      end

      struct HostDataDockerContainerPorts
        include JSON::Serializable
        @[JSON::Field(key: "IP")]
        property ip : String?

        @[JSON::Field(key: "Type")]
        property type : String?

        @[JSON::Field(key: "PublicPort")]
        property publicport : Int64?

        @[JSON::Field(key: "PrivatePort")]
        property privateport : Int64?
      end

      struct HostDataDockerContainerMounts
        include JSON::Serializable
        @[JSON::Field(key: "RW")]
        property rw : Bool?

        @[JSON::Field(key: "Propagation")]
        property propagation : String?

        @[JSON::Field(key: "Destination")]
        property destination : String?

        @[JSON::Field(key: "Source")]
        property source : String?

        @[JSON::Field(key: "Mode")]
        property mode : String?

        @[JSON::Field(key: "Type")]
        property type : String?
      end

      struct HostDataDockerContainerNetworkSettings
        include JSON::Serializable
        @[JSON::Field(key: "Networks")]
        property network : Hash(String, HostDataDockerContainerNetwork)?

        struct HostDataDockerContainerNetwork
          include JSON::Serializable
          @[JSON::Field(key: "NetworkID")]
          property networkid : String?

          @[JSON::Field(key: "MacAddress")]
          property macaddress : String?

          @[JSON::Field(key: "GlobalIPv6PrefixLen")]
          property globalipv6prefixlen : Int64?

          @[JSON::Field(key: "Links")]
          property links : Array(String)?

          @[JSON::Field(key: "GlobalIPv6Address")]
          property globalipv6address : String?

          @[JSON::Field(key: "IPv6Gateway")]
          property ipv6gateway : String?

          @[JSON::Field(key: "IPAMConfig")]
          property ipamconfig : String?

          @[JSON::Field(key: "DriverOpts")]
          property driveropts : String?

          @[JSON::Field(key: "IPPrefixLen")]
          property ipprefixlen : Int64?

          @[JSON::Field(key: "EndpointID")]
          property endpointid : String?

          @[JSON::Field(key: "IPAddress")]
          property ipaddress : String?

          @[JSON::Field(key: "Gateway")]
          property gateway : String?

          @[JSON::Field(key: "Aliases")]
          property aliases : Array(String)?
        end
      end
    end

    struct HostDataDockerPlatform
      include JSON::Serializable
      @[JSON::Field(key: "Name")]
      property name : String?
    end
  end
end
