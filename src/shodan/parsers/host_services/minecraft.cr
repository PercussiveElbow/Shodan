module Shodan
    struct HostDataMinecraft include JSON::Serializable
        property version : HostDataMinecraftServerVersion?
        property players : HostDataMinecraftPlayersInfo?
        property forgeData : HostDataMinecraftForgeInfo?
        property modinfo : HostDataMinecraftModInfo?
        property description : String?
        property favicon : String? 
        property whitelisted : Bool?  


        struct HostDataMinecraftServerVersion include JSON::Serializable
            property protocol : Int64?
            property name : String?
        end

        struct HostDataMinecraftPlayersInfo include JSON::Serializable
            property max : Int64?
            property name : String? 
        end

        struct HostDataMinecraftForgeInfo include JSON::Serializable
            property channels : Array(HostDataMinecraftForgeChannels)?
            property mods : Array(HostDataMinecraftMod)?
            property fmlNetworkVersion : Int64?
        end

        struct HostDataMinecraftForgeChannels include JSON::Serializable
            property res : String? 
            property version : String? 
            property required : Bool? 
        end

        struct HostDataMinecraftMod include JSON::Serializable
            property modmarker : String?
            property modId : String? 
        end

        struct HostDataMinecraftModInfoItem include JSON::Serializable
            property version : String?
            property modId : String?
        end

        struct HostDataMinecraftPlayers include JSON::Serializable
            property id : String? 
            property name : String?
        end


        struct HostDataMinecraftModInfo include JSON::Serializable
            property type : String? 
            property modList : Array(HostDataMinecraftModInfoItem)?
        end

    end


end