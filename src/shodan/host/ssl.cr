
module Shodan
    struct HostDataSSL include JSON::Serializable
        property versions : Array(String)?
        property acceptable_cas : Array(String)?
        property chain : Array(String)?
        property alpn : Array(String)?
        property cert : HostDataSSLCert? 
        property dhparams : HostDataSSLDHParams?
        property cipher : HostDataSSLCipher?
        property tlssext : Array(HostDataSSLTlsext)?
    end

    struct HostDataSSLDHParams include JSON::Serializable
        property prime : String? 
        property public_key : String?
        property bits : Int32? 
        property generator : Int32? 
        property fingerprint : String? 
    end

    struct HostDataSSLTlsext include JSON::Serializable
        property id : Int32?
        property name : String?
    end

    struct HostDataSSLCert include JSON::Serializable
        property sig_alg : String? 
        property issued : String? 
        property expires : String? 
        property expired : Bool?
        property version : Int32? 
        property extensions : Array(String)?
        property fingerprint : Hash(String,String)?
        property serial : Int64? 
    end

    struct HostDataSSLCipher include JSON::Serializable
        property version : String? 
        property bits : Int32?
        property name : String? 
    end
end