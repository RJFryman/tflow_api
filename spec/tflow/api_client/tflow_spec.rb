require 'spec_helper'

describe Tflow::ApiClient::Tflow do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should get a specific tflow based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v2/tflow/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflow.json"))
     response = @client.get_tflow('100')
     response.should == {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}
   end

   it 'should list all tflows' do
     stub_request(:get, 'http://10.0.0.1/api/v2/tflow/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflows.json"))
     response = @client.list_tflows()
     response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}]
   end

   it 'should get entity tflows' do
     stub_request(:get, 'http://10.0.0.1/api/v2/tflow/1/1').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflow_queues.json"))
     response = @client.get_entity_tflows(1,1)
     response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"CMYK"}, {"id"=>"808:11", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"Passthrough"}]
   end

   it 'should get entity tflows' do
     stub_request(:post, 'http://10.0.0.1/api/v2/tflow/1/1').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflow_queues.json"))
     response = @client.set_tflow_queue(1,1, {tflowIds: [1,2,3]})
     response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"CMYK"}, {"id"=>"808:11", "tflow_name"=>"TURBINE-F-808", "queue_name"=>"Passthrough"}]
   end
end
