require 'spec_helper'

describe Tflow::ApiClient::Client do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

  it 'should create a client' do
    stub_request(:post, 'http://10.0.0.1/api/v2/client/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("create_client.json"))
    json_payload =
    {
        "name": "Light Cola, Ltd.",
        "tflows": [{"id": "909:2"}]
    }
    response = @client.create_client(json_payload)
    response.should == {"name"=>"Light Cola, Ltd.", "tflows"=>[{"id"=>"909:2"}]}
  end

  it 'should get a specific client based on id' do
    stub_request(:get, 'http://10.0.0.1/api/v2/client/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("client.json"))
    response = @client.get_client('100')
    response.should == {"id"=>100, "name"=>"Anonymous Uploading"}
  end

  it 'should list all clients' do
    stub_request(:get, 'http://10.0.0.1/api/v2/client/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("clients.json"))
    response = @client.list_clients()
    response.should == [{"id"=>1, "name"=>"{instance company}"}, {"id"=>100, "name"=>"Anonymous Uploading"}]
  end

  it 'should get a clients tflows' do
    stub_request(:get, 'http://10.0.0.1/api/v2/client/100/tflows').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("client_tflows.json"))
    response = @client.get_client_tflows(100)
    response.should == [{"id"=>"808:1", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"Full Color"}, {"id"=>"808:2", "tflow_name"=>"TURBINE_F_808", "queue_name"=>"CMYK"}]
  end

  it 'should get client initial info' do
    stub_request(:get, 'http://10.0.0.1/api/v2/client/getInitialInfo').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("client_intial_info.json"))
    response = @client.get_client_initial_info
    response.should == {"allowedTflows"=>[{"id"=>"909:1", "tflow_id"=>"909", "tflow_name"=>"TURBINE_909", "queue_id"=>"1", "queue_name"=>"Full Color"}], "allowedVisibleToInstanceUsers"=>[{"user_id"=>115, "user_name"=>"Jaeden Waelchi", "user_email"=>"brakus.kory@yahoo.com", "client_id"=>1, "client_name"=>"Tucanna"}, {"user_id"=>106, "user_name"=>"Lavonne Pouros", "user_email"=>"eichmann.adriana@yahoo.com", "client_id"=>1, "client_name"=>"Tucanna"}], "allowedVisibleToNonInstanceUsers"=>[{"user_id"=>101, "user_name"=>"Kari Blick", "user_email"=>"gideon52@yahoo.com", "client_id"=>101, "client_name"=>"Beatty and Sons"}, {"user_id"=>112, "user_name"=>"Lucile Torphy", "user_email"=>"melisa.feil@okuneva.org", "client_id"=>100, "client_name"=>"Anonymous Uploading"}], "defaults"=>{"tflows"=>["909:1"], "visible_to_instance_user_ids"=>[115], "visible_to_non_instance_user_ids"=>[101]}}
  end

end
