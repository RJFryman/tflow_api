require 'spec_helper'

describe Tflow::ApiClient::Authentication do

  it 'should return an authentication token' do
    @client = Tflow::ApiClient.new("http://10.0.0.1")
    stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
    response = @client.authentication(123,123)
    response.should == "Bearer RDdhuIuHyRQKKtLQmJteNT3D0xOzqvYwib01BGLi"
  end

  it 'should return an version number' do
    @client = Tflow::ApiClient.new("http://10.0.0.1")
    stub_request(:get, 'http://10.0.0.1/api/version').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("version.json"))
    response = @client.version
    response.should == { "version" => "0.2.6280", "branch" => "trunk" }
  end

end
