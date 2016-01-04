require 'spec_helper'

describe Tflow::ApiClient::Order do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'it should create an order' do
     stub_request(:post, 'http://10.0.0.1/api/v1/order/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("order.json"))
     json_payload = {
     	"id": 1,
     	"name": "Name for very first order",
     	"description": "Description for the order",
     	"ship_date": "2016-01-01T00:00:00+0100",
     	"kfpx": "Passthrough",
     	"assignments": {
     		"upload_revision": [{
     			"user_id": 100
     		}],
     		"approve_jobs": [{
     			"user_id": 100
     		}, {
     			"user_id": 101
     		}],
     		"release_jobs": [{
     			"user_id": 210
     		}, {
     			"user_id": 100
     		}],
     		"upload_proofs": [{
     			"user_id": 132
     		}]
     	},
     	"tflows": [{
     		"id": "808:1"
     	}],
     	"props": {
     		"print_width": "47.56",
     		"print_height": "50.24",
     		"min_ppi": "330",
     		"product_types": nil,
     		"rep_name": nil,
     		"pm_name": nil
     	}
     }
     response = @client.create_order(json_payload)
     response.should == {"id"=>1, "name"=>"Name for very first order", "description"=>"Description for the order", "ship_date"=>"2016-01-01T00:00:00+0100", "kfpx"=>"Passthrough", "assignments"=>{"upload_revision"=>[{"user_id"=>100}], "approve_jobs"=>[{"user_id"=>100}, {"user_id"=>101}], "release_jobs"=>[{"user_id"=>210}, {"user_id"=>100}], "upload_proofs"=>[{"user_id"=>132}]}, "tflows"=>[{"id"=>"808:1"}], "props"=>{"print_width"=>"47.56", "print_height"=>"50.24", "min_ppi"=>"330", "product_types"=>nil, "rep_name"=>nil, "pm_name"=>nil}}
   end

   it 'should list all orders' do
     stub_request(:get, 'http://10.0.0.1/api/v1/order/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("orders.json"))
     response = @client.list_orders()
     response.should == [{"id"=>1, "client_id"=>1, "name"=>"TF000002", "description"=>"Lorem ipsum sit amet", "ship_date"=>"2015-10-28T00:00:00+01", "notes"=>nil, "props"=>{"print_width"=>"4", "print_height"=>"5", "min_ppi"=>"0", "product_types"=>nil, "rep_name"=>nil, "pm_name"=>nil}}, {"id"=>2, "client_id"=>5, "name"=>"Some order", "description"=>"Another order description", "ship_date"=>"2016-01-01T00:00:00+01", "notes"=>"Notes for the order", "props"=>{"print_width"=>"45.5", "print_height"=>"88.3", "min_ppi"=>"300", "product_types"=>nil, "rep_name"=>nil, "pm_name"=>nil}}]
   end

   it 'should get a specific order based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v1/order/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("order.json"))
     response = @client.get_order('100')
     response.should == {"id"=>1, "name"=>"Name for very first order", "description"=>"Description for the order", "ship_date"=>"2016-01-01T00:00:00+0100", "kfpx"=>"Passthrough", "assignments"=>{"upload_revision"=>[{"user_id"=>100}], "approve_jobs"=>[{"user_id"=>100}, {"user_id"=>101}], "release_jobs"=>[{"user_id"=>210}, {"user_id"=>100}], "upload_proofs"=>[{"user_id"=>132}]}, "tflows"=>[{"id"=>"808:1"}], "props"=>{"print_width"=>"47.56", "print_height"=>"50.24", "min_ppi"=>"330", "product_types"=>nil, "rep_name"=>nil, "pm_name"=>nil}}
   end

end
