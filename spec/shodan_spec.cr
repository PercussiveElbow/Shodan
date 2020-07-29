require "webmock"
require "spec"
require "../src/*"

client = Shodan::Client.new("123")
key_path = "?key=123"

# Account endpoint specs
describe "Account Endpoint" do 
    account_response = File.read("spec/example_responses/account/account_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/account/profile#{key_path}").to_return(status: 200, body: account_response)
    it "should correctly parse an Account endpoint response" do
        account_data = client.account()
        account_data.member.should be_true
    end
end

# API status specs
describe "API Status Endpoint" do
    api_status_response = File.read("spec/example_responses/api_status/api_status_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/api-info#{key_path}").to_return(status: 200, body: api_status_response)
    it "should correctly parse an API Status endpoint response" do
        api_status = client.api_status()
        api_status.scan_credits.should eq 100
    end
end

# Tools endpoint specs
describe "Tools Endpoint" do 
    http_header_resp = File.read("spec/example_responses/tools/http_headers_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/tools/httpheaders#{key_path}").to_return(status: 200, body: http_header_resp)
    it "should correctly parse an HTTP Headers endpoint response" do
        headers_result = client.http_headers()
        expected_headers = {"Content-Length" => "", "Accept-Encoding" => "gzip, deflate", "Connection" => "close", "User-Agent" => "Crystal", "Host" => "api.shodan.io", "Content-Type" => ""}
        headers_result.should eq expected_headers
    end 

    my_ip_resp = File.read("spec/example_responses/tools/myip_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/tools/myip#{key_path}").to_return(status: 200, body: my_ip_resp)
    it "should correctly parse my IP endpoint response" do
        myip_result = client.my_ip()
        myip_result.should eq "1.2.3.4"
    end

end 

## Search endpoint specs
describe "Search Endpoints" do 
    host_response_1 = File.read("spec/example_responses/host/host_example_1.json")
    host_response_2 = File.read("spec/example_responses/host/host_example_2.json") # random compromised off front page
    # host_response_3 = File.read("spec/example_responses/host/host_example_3.json")
    # host_response_4 = File.read("spec/example_responses/host/host_example_4.json")

    WebMock.stub(:get, "https://api.shodan.io/shodan/host/8.8.8.8#{key_path}").to_return(status: 200, body: host_response_1)
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/1.1.1.1#{key_path}").to_return(status: 200, body: host_response_2)


    it "should correctly parse a host endpoint response 1" do 
        host_result = client.host("8.8.8.8")
        host_result.should_not eq Nil
        data = host_result.data
        data.should_not eq Nil
        if data
            data.size().should eq 1
            data[0].org.should eq "Google"
        else 
            raise Exception.new("Failed")
        end
    end

    it "should correctly parse a host endpoint response 2" do 
        host_result = client.host("1.1.1.1")
        host_result.should_not eq Nil
        data = host_result.data
        data.should_not eq Nil
        if data
            data.size().should eq 2
            data[0].org.should eq "Ensite Brasil Telecomunicacoes Ltda - ME"
            data[1].product.should eq "Dropbear sshd"
        else 
            raise Exception.new("Failed")
        end
    end

end

# DNS specs
describe "DNS tests" do
    
end
    
## API Error specs
describe "Error tests" do 
    it "should correctly handle a rate limiting error" do 
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/1.2.3.4#{key_path}").to_return(status: 429, body: "{\"error\": \"Rate limiting error\"}".to_s)
        expect_raises(Shodan::Client::ShodanRateLimitingException) do
            host_result = client.host("1.2.3.4")
        end
    end

    it "should correctly handle an authorization error" do
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/1.2.3.5#{key_path}").to_return(status: 401, body: "{\"error\": \"Rate limiting error\"}".to_s)
        expect_raises(Shodan::Client::ShodanAuthorizationException) do
            host_result = client.host("1.2.3.5")
        end
    end  
    
    it "should correctly handle an invalid IP param" do
        invalid_ip_error = "{\"error\": \"Invalid IP\"}"
        WebMock.stub(:get, "https://api.shodan.io/shodan/host/notavalidip#{key_path}").to_return(status: 404, body: invalid_ip_error)
        expect_raises(Shodan::Client::ShodanHostNotfoundException) do
            host_result = client.host("notavalidip")
        end
    end

end
