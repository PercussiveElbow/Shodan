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
        property redirects : Array(String)?
        # other details
        property server : String?
        property title : String?
        property favicon : String? 
        property host : String?
        # components
        property components : Hash(String,Hash(String,Array(String)))?

    end
end