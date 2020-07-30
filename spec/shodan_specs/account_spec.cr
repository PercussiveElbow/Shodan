
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