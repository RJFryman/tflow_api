require 'spec_helper'

describe Tflow::ApiClient::TflowDownload do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should list all ready jobs' do
     stub_request(:get, 'http://10.0.0.1/api/v2/tflowDownload/checkReady').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("tflow_downloads.json"))
     response = @client.list_ready_jobs()
     response.should == {"tflow"=>{"id"=>"DDF3E613-F7BF-4B12-8A10-4B0372D7062C", "name"=>"TURBINE_A_444"}, "queues"=>[{"id"=>"777E41D7-6868-4C8C-9DA7-9B6C31DD428B", "name"=>"Full Color"}, {"id"=>"D20E6ACB-745D-45AA-8DE3-21B733F153F0", "name"=>"CMYK"}]}
   end

   it 'should set download state' do
     stub_request(:post, 'http://10.0.0.1/api/v2/tflowDownload/checkReady').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("download_state.json"))
     response = @client.set_download_state(1, {"download_state": "end_ok"})
     response.should == {"download_state"=>"end_ok"}
   end
end
