module Shodan
  struct HostDataMongoDB
    include JSON::Serializable
    property authentication : Bool
    property buildInfo : HostDataMongoBuildInfo
    property listDatabases : HostDataMongoListDatabases?
    # property serverStatus : HostDataMongoDBServerStatus?
  end

  struct HostDataMongoDBServerStatus
    include JSON::Serializable
    # property metrics : HostDataMongoDBMetrics

  end

  struct HostDataMongoBuildInfo
    include JSON::Serializable
    property allocator : String?
    property bits : Int64
    property buildEnvironment : HostDataMongoBuildEnvironment?
    property compilerFlags : String?
    property compilerVersion : String?
    property debug : Bool?
    property gitVersion : String?
    property javascriptEngine : String?
    property loaderFlags : String?
    property maxBsonObjectSize : Int64?
    property memory_sanitize : Bool?
    property modules : Array(String)?
    property ok : Float64

    @[JSON::Field(key: "OpenSSLVersion")]
    property openssl_version : String?

    property openssl : HostDataMongoOpenSSL?
    property pcre_jit : Bool?
    property psmdbVersion : String?
    property sonarVersion : String?
    property sonardb : Bool?
    property storageEngines : Array(String)?
    property sysInfo : String
    property targetMinOS : String?
    property timestamp : String?
    property tokukvVersion : String?
    property tokumxVersion : String?
    property version : String
    property versionArray : Array(Int64)?
  end

  struct HostDataMongoBuildEnvironment
    include JSON::Serializable
    property bits : Int64?
    property cc : String?
    property ccflags : String?
    property cxx : String?
    property cxxflags : String?
    property distarch : String?
    property distmod : String?
    property linkflags : String?
    property target_arch : String?
    property target_os : String?
  end

  struct HostDataMongoListDatabases
    include JSON::Serializable
    property databases : Array(HostDataMongoDatabase)
    property ok : Float64
    property totalSize : Float64
    property totalUncompressedSize : Float64
  end

  struct HostDataMongoDatabase
    include JSON::Serializable
    property collections : Array(String)
    property empty : Bool?
    property name : String?
    property name : String
    property size : Float64
    property sizeOnDisk : Float64
  end

  struct HostDataMongoOpenSSL
    include JSON::Serializable
    property compiled : String?
    property running : String?
  end
end
