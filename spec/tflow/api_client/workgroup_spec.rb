require 'spec_helper'

describe Tflow::ApiClient::Workgroup do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should get a specific workgroup based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v1/workgroup/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("workgroup.json"))
     response = @client.get_workgroup('100')
     response.should == {"id"=>1, "name"=>"Instance Company Managers", "description"=>"This workgroup has all possible rights in the system", "owning_client_id"=>1}
   end

   it 'should list all workgroups' do
     stub_request(:get, 'http://10.0.0.1/api/v1/workgroup/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("workgroups.json"))
     response = @client.list_workgroups()
     response.should == [{"id"=>1, "name"=>"Instance Company Managers", "description"=>"This workgroup has all possible rights in the system", "owning_client_id"=>1}, {"id"=>2, "name"=>"SR", "description"=>"Sales Representatives", "owning_client_id"=>1}]
   end

end
