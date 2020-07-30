client = Shodan::Client.new("123")
key_path = "?key=123"
key_path_ampersand = "&key=123"

# DNS specs
describe "DNS tests" do

    domain_response_1 = File.read("spec/example_responses/dns/domain_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/dns/domain/cnn.com#{key_path}").to_return(status: 200, body: domain_response_1)
    it "should correctly parse an domain endpoint response" do
        domain_result = client.domain("cnn.com")
        data = domain_result.data
        if data 
            data.size().should eq 752
        else 
            raise Exception.new("Failed")
        end
    end
    
    resolve_response_1 = File.read("spec/example_responses/dns/resolve_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/dns/resolve?hostnames=cnn.com#{key_path_ampersand}").to_return(status: 200, body: resolve_response_1)
    it "should correctly parse a resolve endpoint response" do 
        resolve_result = client.dns_resolve(["cnn.com"])
        resolve_result.is_a?(Hash(String,String)).should be_true
        resolve_result["cnn.com"].should eq "151.101.1.67"
    end

    reverse_response_1 = File.read("spec/example_responses/dns/reverse_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/dns/reverse?ips=74.125.227.230#{key_path_ampersand}").to_return(status: 200, body: reverse_response_1)
    it "should correctly parse a dns reverse endpoint response" do
        reverse_result = client.dns_reverse(["74.125.227.230"])
    end
end