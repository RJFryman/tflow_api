require 'spec_helper'

describe Tflow::ApiClient::Job do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should list all job transitions' do
     stub_request(:get, 'http://10.0.0.1/api/v1/job/100/allowedTransitions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("job_transitions.json"))
     response = @client.list_job_transitions(100)
     response.should == ["approve", "close_to_rejected", "request_new_revision"]
   end

   it 'should execute a transistion on a job' do
     stub_request(:post, 'http://10.0.0.1/api/v1/job/100/executeTransition').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("job_transition.json"))
     response = @client.executeTransition(100, "approve")
     response.should == {"id"=>100, "name"=>"approve"}
   end

   it 'should list all job revisions' do
     stub_request(:get, 'http://10.0.0.1/api/v1/job/100/revisions').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("job_revisions.json"))
     response = @client.list_job_revisions(100)
     response.should == [{"id"=>1, "job_id"=>2, "exception_code"=>nil, "exception_message"=>nil}, {"id"=>3, "job_id"=>2, "exception_code"=>nil, "exception_message"=>nil}]
   end

   it 'it should create an order' do
     stub_request(:post, 'http://10.0.0.1/api/v1/job/create').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("job.json"))
     json_payload = {
         "name": "rem",
         "order_id": 1,
         "kfpx": "CMYK",
         "ship_date": "2018-11-30T23:59:59+07",
         "description": "Nisi nemo reiciendis porro ut nemo a sapiente. Ducimus ut maxime corporis reiciendis.",
         "notes": "omnis dolorem veniam illum officia at praesentium est ad id",
         "priority": 2,
         "attach_proofs": false,
         "assignments": {
             "upload_revision": [{"user_id": 100}],
             "approve_jobs": [{"user_id": 100}],
             "release_jobs": [{"user_id": 100}],
             "upload_proofs": [{"user_id": 100}]
         },
         "tflows": [{"id": "808:1"}, {"id": "909:5"}],
         "props": {
             "print_width": 136.5730,
             "print_height": 362.36,
             "sales_rep": "1",
             "quantity": 80,
             "shipping_address": "61856 Farrell Loop\nLake Ezekiel, KS 05244",
             "phone_contact": "750.379.0693",
             "email_contact": "lonny.wisozk@altenwerth.com"
         }
     }
     response = @client.create_job(json_payload)
     response.should == {"name"=>"rem", "order_id"=>1, "kfpx"=>"CMYK", "ship_date"=>"2018-11-30T23:59:59+07", "description"=>"Nisi nemo reiciendis porro ut nemo a sapiente. Ducimus ut maxime corporis reiciendis.", "notes"=>"omnis dolorem veniam illum officia at praesentium est ad id", "priority"=>2, "attach_proofs"=>false, "assignments"=>{"upload_revision"=>[{"user_id"=>100}], "approve_jobs"=>[{"user_id"=>100}], "release_jobs"=>[{"user_id"=>100}], "upload_proofs"=>[{"user_id"=>100}]}, "tflows"=>[{"id"=>"808:1"}, {"id"=>"909:5"}], "props"=>{"print_width"=>136.573, "print_height"=>362.36, "sales_rep"=>"1", "quantity"=>80, "shipping_address"=>"61856 Farrell Loop\nLake Ezekiel, KS 05244", "phone_contact"=>"750.379.0693", "email_contact"=>"lonny.wisozk@altenwerth.com"}}
   end

   it 'should list all jobs' do
     stub_request(:get, 'http://10.0.0.1/api/v1/job/list').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("jobs.json"))
     response = @client.list_jobs()
     response.should == [{"id"=>1, "order_id"=>1, "name"=>"TF000002-1", "description"=>nil, "ship_date"=>"2015-10-28 00:00:00", "notes"=>nil, "priority"=>1, "current_state_name"=>"to_upload_first", "props"=>{"print_width"=>"4", "print_height"=>"5", "min_ppi"=>"0", "sales_rep"=>nil, "quantity"=>nil, "shipping_address"=>nil, "phone_contact"=>nil, "email_contact"=>nil, "product_types"=>nil, "mis_job_number"=>nil, "mis_contact"=>nil, "rep_name"=>nil, "pm_name"=>nil}}, {"id"=>2, "order_id"=>1, "name"=>"TF000002-2", "description"=>"Sample job description", "ship_date"=>"2015-10-28T00:00:00+0100", "notes"=>nil, "priority"=>1, "current_state_name"=>"approved", "props"=>{"print_width"=>"4", "print_height"=>"5", "min_ppi"=>"0", "sales_rep"=>nil, "quantity"=>nil, "shipping_address"=>nil, "phone_contact"=>nil, "email_contact"=>nil, "product_types"=>nil, "mis_job_number"=>nil, "mis_contact"=>nil, "rep_name"=>nil, "pm_name"=>nil}}]
   end

   it 'should get a specific job based on id' do
     stub_request(:get, 'http://10.0.0.1/api/v1/job/100').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("job.json"))
     response = @client.get_job('100')
     response.should == {"name"=>"rem", "order_id"=>1, "kfpx"=>"CMYK", "ship_date"=>"2018-11-30T23:59:59+07", "description"=>"Nisi nemo reiciendis porro ut nemo a sapiente. Ducimus ut maxime corporis reiciendis.", "notes"=>"omnis dolorem veniam illum officia at praesentium est ad id", "priority"=>2, "attach_proofs"=>false, "assignments"=>{"upload_revision"=>[{"user_id"=>100}], "approve_jobs"=>[{"user_id"=>100}], "release_jobs"=>[{"user_id"=>100}], "upload_proofs"=>[{"user_id"=>100}]}, "tflows"=>[{"id"=>"808:1"}, {"id"=>"909:5"}], "props"=>{"print_width"=>136.573, "print_height"=>362.36, "sales_rep"=>"1", "quantity"=>80, "shipping_address"=>"61856 Farrell Loop\nLake Ezekiel, KS 05244", "phone_contact"=>"750.379.0693", "email_contact"=>"lonny.wisozk@altenwerth.com"}}
   end
end
