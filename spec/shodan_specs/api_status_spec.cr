client = Shodan::Client.new("123")
key_path = "?key=123"

# API status specs
describe "API Status Endpoint" do
    api_status_response = File.read("spec/example_responses/api_status/api_status_example_1.json")
    WebMock.stub(:get, "https://api.shodan.io/api-info#{key_path}").to_return(status: 200, body: api_status_response)
    it "should correctly parse an API Status endpoint response" do
        api_status = client.api_status()
        api_status.scan_credits.should eq 100
    end
end