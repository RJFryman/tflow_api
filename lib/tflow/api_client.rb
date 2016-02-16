require_relative 'api_client/authentication'
require_relative 'api_client/client'
require_relative 'api_client/job'
require_relative 'api_client/order'
require_relative 'api_client/revision'
require_relative 'api_client/role'
require_relative 'api_client/tflow'
require_relative 'api_client/user'
require_relative 'api_client/workgroup'

require 'faraday'
require 'faraday_middleware'

module Tflow
  class ApiClient

    def initialize(url, access_token=nil)
      @access_token = access_token
      @client ||= Faraday.new(:url => url) do |http|
        http.request :url_encoded
        http.adapter :net_http
        http.response :json, :content_type => /\bjson$/
      end
    end

    include Authentication
    include Client
    include Job
    include Order
    include Revision
    include Role
    include Tflow
    include User
    include Workgroup
  end
end
