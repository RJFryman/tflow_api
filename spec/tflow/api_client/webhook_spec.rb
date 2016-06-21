require 'spec_helper'

describe Tflow::ApiClient::Webhook do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should create a webhook' do
     stub_request(:post, 'http://10.0.0.1/api/v2/webhook/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("webhook.json"))
     response = @client.create_webhook({"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == {"name"=>"job.approved", "url"=>"http://some.domain.org/path/to/resource", "security_key"=>"abcdef"}
   end

   it 'should delete a webhook' do
     stub_request(:delete, "http://10.0.0.1/api/v2/webhook/100").
              with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer RDdhuIuHyRQKKtLQmJteNT3D0xOzqvYwib01BGLi'}).
              to_return(:status => 200, :body => "nothing", :headers => {})
     response = @client.delete_webhook('100')
     response.should == "nothing"
   end

   it 'should get a webhook' do
     stub_request(:get, 'http://10.0.0.1/api/v2/webhook/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("webhook.json"))
     response = @client.get_webhook(100)
     response.should == {"name"=>"job.approved", "url"=>"http://some.domain.org/path/to/resource", "security_key"=>"abcdef"}
   end

   it 'should list a webhook' do
     stub_request(:get, 'http://10.0.0.1/api/v2/webhook/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("webhook.json"))
     response = @client.list_webhooks
     response.should == {"name"=>"job.approved", "url"=>"http://some.domain.org/path/to/resource", "security_key"=>"abcdef"}
   end

   it 'should update a webhook' do
     stub_request(:post, 'http://10.0.0.1/api/v2/webhook/1').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("webhook.json"))
     response = @client.update_webhook(1)
     response.should == {"name"=>"job.approved", "url"=>"http://some.domain.org/path/to/resource", "security_key"=>"abcdef"}
   end

end
