require 'spec_helper'

describe Tflow::ApiClient::User do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should create a user' do
     stub_request(:post, 'http://10.0.0.1/api/v1/user/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("user.json"))
     json_payload = {
         "email": "Isaisas87@gmail.com",
         "client_id": 100,
         "name": "Jasmin Mraz",
         "enabled": true,
         "phonenumber": "(450)751-3198x00937",
         "locale": "ru",
         "workgroups": [{"id":1},{"id":10}],
         "alertTypes": ["comment.create","job.create"]
     }
     response = @client.create_user(json_payload)
     response.should == {"email"=>"Isaisas87@gmail.com", "client_id"=>100, "name"=>"Jasmin Mraz", "enabled"=>true, "phonenumber"=>"(450)751-3198x00937", "locale"=>"ru", "workgroups"=>[{"id"=>1}, {"id"=>10}], "alertTypes"=>["comment.create", "job.create"]}
   end

   it 'should get a specific user based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v1/user/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("user.json"))
     response = @client.get_user('100')
     response.should ==  {"email"=>"Isaisas87@gmail.com", "client_id"=>100, "name"=>"Jasmin Mraz", "enabled"=>true, "phonenumber"=>"(450)751-3198x00937", "locale"=>"ru", "workgroups"=>[{"id"=>1}, {"id"=>10}], "alertTypes"=>["comment.create", "job.create"]}
   end

   it 'should list all users' do
     stub_request(:get, 'http://10.0.0.1/api/v1/user/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("users.json"))
     response = @client.list_users()
     response.should == [{"id"=>100, "email"=>"nobody@nowhere.net", "client_id"=>1, "name"=>"Nobody Nowhere", "email_frequency"=>"realtime", "enabled"=>true, "phonenumber"=>nil, "locale"=>"en"}, {"id"=>102, "email"=>"Isaias87@gmail.com", "client_id"=>100, "name"=>"Jasmin Mraz", "email_frequency"=>"realtime", "enabled"=>true, "phonenumber"=>"(450)751-3198x00937", "locale"=>"ru"}]
   end
end
