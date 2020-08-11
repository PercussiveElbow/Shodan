module Shodan
    struct HostDataHTTP include JSON::Serializable
        # html
        property html : String?
        property html_hash : Int64?
        # securitytxt
        property securitytxt : String?
        property securitytxt_hash : Int64?
        #robots
        property robots : String?
        property robots_hash : Int64?
        # sitemaps
        property sitemap : String? 
        property sitemap_hash : Int64?
        # location and redirect
        property location : String? 
        property redirects : Array(HostDataHTTPRedirects)?
        # other details
        property server : String?
        property title : String?
        property favicon : HostDataHTTPFavicon? 
        property host : String?
        # components
        property components : Hash(String,Hash(String,Array(String)))?

    end

    struct HostDataHTTPRedirects include JSON::Serializable
        property host : String? 
        property data : String? 
        property html : String? 
        property location : String?
    end

    struct HostDataHTTPFavicon include JSON::Serializable
        property hash : Int64?
        property data : String?
        property location : String? 
    end
end