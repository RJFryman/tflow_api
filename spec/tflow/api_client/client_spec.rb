require 'spec_helper'

describe Tflow::ApiClient::Client do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

  it 'should create a client' do
    stub_request(:post, 'http://10.0.0.1/api/v1/client/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("create_client.json"))
    name = "Light Cola, Ltd."
    tflows = ["id": "909:2"]
    response = @client.create_client(name, tflows)
    response.should == {"name"=>"Light Cola, Ltd.", "tflows"=>[{"id"=>"909:2"}]}
  end

  it 'should get a specific client based on id' do
    stub_request(:get, 'http://10.0.0.1/api/v1/client/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("client.json"))
    response = @client.get_client('100')
    response.should == {"id"=>100, "name"=>"Anonymous Uploading"}
  end

  it 'should list all clients' do
    stub_request(:get, 'http://10.0.0.1/api/v1/client/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("clients.json"))
    response = @client.list_clients()
    response.should == [{"id"=>1, "name"=>"{instance company}"}, {"id"=>100, "name"=>"Anonymous Uploading"}]
  end

  it 'should get a clients tflows' do
    stub_request(:get, 'http://10.0.0.1/api/v1/client/100/tflows').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("client_tflows.json"))
    response = @client.get_client_tflows(100)
    response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}]
  end

end
