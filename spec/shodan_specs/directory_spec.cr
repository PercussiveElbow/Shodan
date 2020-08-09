
client = Shodan::Client.new("123")
key_path = "?key=123"
key_path_ampersand = "&key=123"

# Directory endpoint specs
describe "Directory Endpoint" do 

    directory_query_response = File.read("spec/example_responses/directory/directory_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/query#{key_path}").to_return(status: 200, body: directory_query_response)
    it "should correctly parse an Directory Query endpoint response" do
        directory_query_result = client.directory_query()
        directory_query_result.total.should eq 6507
        matches = directory_query_result.matches
        if matches 
            matches.size().should eq 10
            matches[0].is_a?(Shodan::DirectoryQueryMatch).should be_true
        else 
            raise Exception.new("Failed")
        end
    end

    directory_query_tags_response = File.read("spec/example_responses/directory/directory_tags_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/query/tags#{key_path}&size=10").to_return(status: 200, body: directory_query_tags_response)
    it "should correctly parse an Directory Query Tags endpoint response" do
        directory_query__tags_result = client.directory_query_tags()
        directory_query__tags_result.total.should eq 7411
        matches = directory_query__tags_result.matches
        if matches 
            matches.size().should eq 10
            matches[0].is_a?(Shodan::DirectoryQueryTagMatch).should be_true
        else 
            raise Exception.new("Failed")
        end
    end

    directory_query_Search_response = File.read("spec/example_responses/directory/directory_search_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/shodan/query/search#{key_path}&query=compromised&page=10").to_return(status: 200, body: directory_query_Search_response)
    it "should correctly parse an Directory Query Search endpoint response" do
        directory_query_search_results = client.directory_query_search("compromised")
        directory_query_search_results.total.should eq 4
        matches = directory_query_search_results.matches
        if matches 
            matches.size().should eq 4
            matches[0].is_a?(Shodan::DirectoryQueryMatch).should be_true
        else 
            raise Exception.new("Failed")
        end
    end

end