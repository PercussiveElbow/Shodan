client = Shodan::Client.new("123")
key_path = "?key=123"

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