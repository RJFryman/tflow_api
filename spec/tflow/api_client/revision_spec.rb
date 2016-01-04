require 'spec_helper'

describe Tflow::ApiClient::Revision do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end 
   # download_lowres_pdf
   # download_original_file
   # download_preflighted_pdf
   # download_proof_pdf
end
