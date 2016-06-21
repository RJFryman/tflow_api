require 'spec_helper'

describe Tflow::ApiClient::DynamicProperties do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should list permissions' do
     stub_request(:get, 'http://10.0.0.1/api/v2/prop/1').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("dynamic_properites.json"))
     response = @client.get_dynamic_properties("1")
     response.should == [{"id"=>2, "input_type"=>"text", "name"=>"print_width", "display_name"=>"Print Width", "display_order"=>0, "js_validation_rules_proc"=>"mandatorySize", "default_value"=>nil, "list_values"=>[]}, {"id"=>1, "input_type"=>"select", "name"=>"sales_rep", "display_name"=>"Sales Rep", "display_order"=>30, "js_validation_rules_proc"=>"positiveNumber", "default_value"=>nil, "list_values"=>[{"id"=>130, "name"=>"Lottie Hamill"}, {"id"=>132, "name"=>"Glen Abbott"}, {"id"=>134, "name"=>"Marlin Lesch"}, {"id"=>175, "name"=>"Cassie Crooks"}, {"id"=>176, "name"=>"Ardella Hansen"}, {"id"=>156, "name"=>"Dangelo Ullrich"}]}, {"id"=>5, "input_type"=>"textarea", "name"=>"shipping_address", "display_name"=>"Shipping Address", "display_order"=>50, "js_validation_rules_proc"=>nil, "default_value"=>nil, "list_values"=>[]}, {"id"=>11, "input_type"=>"multiselect", "name"=>"product_types", "display_name"=>"Product Types", "display_order"=>80, "js_validation_rules_proc"=>nil, "default_value"=>nil, "list_values"=>[{"id"=>1, "name"=>"Product #1"}, {"id"=>2, "name"=>"Product #2"}, {"id"=>3, "name"=>"Product #3"}]}]
   end
end
