module Shodan
  struct HostDataSSL
    include JSON::Serializable
    property versions : Array(String)?
    property acceptable_cas : Array(SslAcceptableCA)
    property chain : Array(String)?
    property alpn : Array(String)?
    property cert : HostDataSSLCert?
    property dhparams : HostDataSSLDHParams?
    property cipher : HostDataSSLCipher?
    property tlssext : Array(HostDataSSLTlsext)?
  end

  struct SslAcceptableCA 
    include JSON::Serializable
    property components : SslCertComponents
    property hash : Int64
    property raw : String
  end

  struct SslCertComponents 
    include JSON::Serializable
    @[JSON::Field(key: "C")]
    property c : String? 
    @[JSON::Field(key: "CN")]
    property c : String?    
    @[JSON::Field(key: "DC")]
    property dc : String?
    @[JSON::Field(key: "L")]
    property l : String?        
    @[JSON::Field(key: "OU")]
    property ou : String?
    @[JSON::Field(key: "SN")]
    property sn : String?
    @[JSON::Field(key: "ST")]
    property st : String?
    property emailAddress : String? 
    property serialNumber : String?
  end

  struct HostDataSSLDHParams
    include JSON::Serializable
    property prime : String?
    property public_key : String?
    property bits : Int32?
    property generator : Int64?
    property fingerprint : String?
  end

  struct HostDataPubKey 
    include JSON::Serializable
    property bits : Int32 
    property type : String
  end

  struct HostDataSSLTlsext
    include JSON::Serializable
    property id : Int32?
    property name : String?
  end

  struct HostDataSSLCert
    include JSON::Serializable
    property sig_alg : String?
    property issued : String?
    property expires : String?
    property expired : Bool?
    property version : Int32?
    property extensions : Array(HostDataSSLExtensions)?
    property fingerprint : Hash(String, String)?
    property serial : Int64?
    property subject : HostDataSslSubject
    property issuer : HostDataSslIssuer
  end

  struct HostDataSslSubject
    include JSON::Serializable
    property businessCategory : String? 
    property description : String? 
    property jurisdictionC : String? 
    property jurisdictionST : String? 
    property postalCode : String? 
    property street : String? 
  end

  struct HostDataSslIssuer
    include JSON::Serializable
    property name : String?
    @[JSON::Field(key: "UID")]
    property uid : String?
    property dnQualifier : String?
    property subjectAltName : String?
    property unstructuredName : String?
    property unstructuredAddress : String?
    property postalCode : String?
    property street : String?
    @[JSON::Field(key: "UNDEF")]
    property undef : String?
  end
  

  struct HostDataSSLCipher
    include JSON::Serializable
    property version : String?
    property bits : Int32?
    property name : String?
  end

  struct HostDataSSLExtensions
    include JSON::Serializable
    property data : String?
    property name : String?
  end
end
