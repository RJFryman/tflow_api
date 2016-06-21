require 'spec_helper'

describe Tflow::ApiClient::Revision do
  before(:each) do
     @client = Tflow::ApiClient.new("http://10.0.0.1")
     stub_request(:post, 'http://10.0.0.1/oauth/access_token').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("access_token.json"))
     response = @client.authentication(123,123)
   end

   it 'should delete a revision' do
     stub_request(:delete, "http://10.0.0.1/api/v2/revision/100").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer RDdhuIuHyRQKKtLQmJteNT3D0xOzqvYwib01BGLi'}).
         to_return(:status => 200, :body => "nothing", :headers => {})
     response = @client.delete_revision('100')
     response.should == "nothing"
   end

   it 'should download a lowres pdf' do
     stub_request(:get, 'http://10.0.0.1/api/v2/revision/1/lowresFile').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("image.json"))
     response = @client.download_lowres_pdf(1)
     response.should == {"image"=>"Im an Image"}
   end

   it 'should download original file' do
     stub_request(:get, 'http://10.0.0.1/api/v2/revision/1/originalFile').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("image.json"))
     response = @client.download_original_file(1)
     response.should == {"image"=>"Im an Image"}
   end

   it 'should download preflighted pdf' do
     stub_request(:get, 'http://10.0.0.1/api/v2/revision/1/preflightedPdf').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("image.json"))
     response = @client.download_preflighted_pdf(1)
     response.should == {"image"=>"Im an Image"}
   end

   it 'should download the proof pdf' do
     stub_request(:get, 'http://10.0.0.1/api/v2/revision/1/proof').to_return(:headers => {"Content-Type"=> "application/json"}, :body => fixture("image.json"))
     response = @client.download_proof_pdf(1)
     response.should == {"image"=>"Im an Image"}
   end
end
