
client = Shodan::Client.new("123")
key_path = "?key=123"

## Search endpoint specs
describe "Host Endpoints Tests -" do 
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

    search_response = File.read("spec/example_responses/host/host_search_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/search#{key_path}&query=Minecraft+Server+port:25565&page=2&minify=false").to_return(status: 200, body: search_response)
    it "should correctly parse a search endpoint response" do 
        search_endpoint_resp = client.host_search("Minecraft Server", page = 2,minify = false, port: "25565")
        
        matches = search_endpoint_resp.matches
        if matches 
            matches.size().should eq 100
            matches[0].product.should eq "Minecraft"
        end
        total = search_endpoint_resp.total
        if total 
            total.should eq 162084
        end
    end

    search_response_2 = File.read("spec/example_responses/host/host_search_example_2.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/search#{key_path}&query=Minecraft+Server+port:25565&page=2&minify=false&facets=+country:1").to_return(status: 200, body: search_response_2)
    it "should correctly parse a search endpoint response" do 
        search_endpoint_resp_2 = client.host_search("Minecraft Server", page = 2,minify = false, port: "25565",facets: { country: 1})
        
        matches = search_endpoint_resp_2.matches
        if matches 
            matches.size().should eq 100
            matches[0].product.should eq "Minecraft"
        end
        total = search_endpoint_resp_2.total
        if total 
            total.should eq 162015
        end
        facets = search_endpoint_resp_2.facets
        if facets 
            facets["country"].size().should eq 1
            facets["country"][0].count.should eq 55430
        end
    end


    count_response = File.read("spec/example_responses/host/host_count_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/host/count#{key_path}&query=Minecraft+Server+port:25565&page=1&minify=true").to_return(status: 200, body: count_response)
    it "should correctly parse a search endpoint response" do 
        count_endpoint_resp = client.host_count("Minecraft Server", port: "25565")
        
        total = count_endpoint_resp.total
        if total 
            total.should eq 162058
        end
    end

    

end
