require 'spec_helper'

describe Tflow::ApiClient::Role do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should list all roles' do
     stub_request(:get, 'http://10.0.0.1/api/v2/role/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.list_roles()
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

   it 'should create a role' do
     stub_request(:post, 'http://10.0.0.1/api/v2/role/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("role.json"))
     response = @client.create_role({"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101}
   end

   it 'should get a role' do
     stub_request(:get, 'http://10.0.0.1/api/v2/role/1').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.get_role(1)
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

   it 'should set assigned users' do
     stub_request(:get, 'http://10.0.0.1/api/v2/role/1/getUsers').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.get_assigned_users(1)
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

   it 'should get permissions' do
     stub_request(:post, 'http://10.0.0.1/api/v2/role/1/setUsers').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("role.json"))
     response = @client.set_assigned_users(1, {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101}
   end

   it 'should get workflow permissions' do
     stub_request(:get, 'http://10.0.0.1/api/v2/role/getPermissions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.get_permissions
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

   it 'should set assigned users' do
     stub_request(:get, 'http://10.0.0.1/api/v2/role/getWorkflowPermissions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("roles.json"))
     response = @client.get_workflow_permissions
     response.should == ["manage_orders", "manage_orders_basic", "admin_orders", "manage_jobs", "manage_jobs_basic", "admin_jobs", "admin_users", "manage_comments", "read_comments", "admin_comments", "admin_clients", "admin_workgroups", "admin_workflows", "download_pdf_report", "download_pdf_preflighted", "download_pdf_lowres", "download_original_artwork", "admin_preferences", "disable_send_invitations", "view_print_file", "view_proof", "reverse_workflow"]
   end

   it 'should set role permissions' do
     stub_request(:post, 'http://10.0.0.1/api/v2/role/setPermissions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("role.json"))
     response = @client.set_role_permissions({"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101}
   end

   it 'should set workflow permissions' do
     stub_request(:post, 'http://10.0.0.1/api/v2/role/setWorkflowPermissions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("role.json"))
     response = @client.set_workflow_permisions({"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101}
   end

   it 'should update role' do
     stub_request(:post, "http://10.0.0.1/api/v2/role/1").
         with(:body => {"description"=>"This role is for production managers", "id"=>"100", "name"=>"Production Manager", "owning_client_id"=>"101"},
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer RDdhuIuHyRQKKtLQmJteNT3D0xOzqvYwib01BGLi', 'Content-Type'=>'application/x-www-form-urlencoded'}).
         to_return(:status => 200, :body => "nothing", :headers => {})
     response = @client.update_role(1, {"id"=>100, "name"=>"Production Manager", "description"=>"This role is for production managers", "owning_client_id"=>101})
     response.should == "nothing"
   end
end
