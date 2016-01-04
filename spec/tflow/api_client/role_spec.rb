require 'spec_helper'

describe Tflow::ApiClient::Role do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should list all roles' do
     stub_request(:get, 'http://10.0.0.1/api/v1/role/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.list_roles()
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

end
