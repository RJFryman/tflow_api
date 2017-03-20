require_relative 'api_client/authentication'
require_relative 'api_client/client'
require_relative 'api_client/dynamic_property'
require_relative 'api_client/job'
require_relative 'api_client/permission'
require_relative 'api_client/product'
require_relative 'api_client/order'
require_relative 'api_client/revision'
require_relative 'api_client/role'
require_relative 'api_client/tflow_download'
require_relative 'api_client/tflow'
require_relative 'api_client/user'
require_relative 'api_client/webhook'

require 'faraday'
require 'faraday_middleware'

module Tflow
  class ApiClient

    def initialize(url, access_token=nil)
      @access_token = access_token
      @client ||= Faraday.new(:url => url) do |http|
        http.request :multipart
        http.request :url_encoded
        http.adapter :net_http
        http.response :json, :content_type => /\bjson$/
      end
    end

    include Authentication
    include Client
    include DynamicProperties
    include Job
    include Order
    include Permission
    include Product
    include Revision
    include Role
    include TflowDownload
    include Tflow
    include User
    include Webhook
  end
end
