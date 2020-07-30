client = Shodan::Client.new("123")
key_path = "?key=123"

## API Error specs
describe "Error tests" do 
    it "should correctly handle a rate limiting error" do 
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/1.2.3.4#{key_path}").to_return(status: 429, body: "{\"error\": \"Rate limiting error\"}".to_s)
        expect_raises(Shodan::ShodanRateLimitingException) do
            host_result = client.host("1.2.3.4")
        end
    end

    it "should correctly handle an authorization error" do
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/1.2.3.5#{key_path}").to_return(status: 401, body: "{\"error\": \"Rate limiting error\"}".to_s)
        expect_raises(Shodan::ShodanAuthorizationException) do
            host_result = client.host("1.2.3.5")
        end
    end  
    
    it "should correctly handle an invalid IP param" do
        invalid_ip_error = "{\"error\": \"Invalid IP\"}"
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/notavalidip#{key_path}").to_return(status: 404, body: invalid_ip_error)
        expect_raises(Shodan::ShodanHostNotfoundException) do
            host_result = client.host("notavalidip")
        end
    end
end