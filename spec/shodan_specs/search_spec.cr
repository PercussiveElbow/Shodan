
client = Shodan::Client.new("123")
key_path = "?key=123"

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

    facets_response = File.read("spec/example_responses/host/facets_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/search/facets#{key_path}").to_return(status: 200, body: facets_response)
    it "should correctly parse a facets endpoint response" do 
        facets_endpoint_resp = client.facets()
        facets_endpoint_resp.size().should eq 76
    end

    filters_response = File.read("spec/example_responses/host/filters_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/search/filters#{key_path}").to_return(status: 200, body: filters_response)
    it "should correctly parse a filters endpoint response" do
        filters_endpoint_resp = client.filters()
        filters_endpoint_resp.size().should eq 74
    end

end
