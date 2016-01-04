require_relative './tflow/version'
require_relative './tflow/api_client'

module Tflow
  class << self

    def new(url, access_token=nil)
      Tflow::ApiClient.new(url, access_token)
    end
  end
end
