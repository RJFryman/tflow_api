require 'spec_helper'

describe Tflow::ApiClient::Tflow do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should get a specific tflow based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v1/tflow/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflow.json"))
     response = @client.get_tflow('100')
     response.should == {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}
   end

   it 'should list all tflows' do
     stub_request(:get, 'http://10.0.0.1/api/v1/tflow/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflows.json"))
     response = @client.list_tflows()
     response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}]
   end
end
