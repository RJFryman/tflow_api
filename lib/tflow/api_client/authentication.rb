require 'pry-byebug'
module Tflow
  class ApiClient
    module Authentication
      # http://demo.tucannatflow.com/apidoc/#api-Authentication

      ### POST /oauth/access_token

      # Requires:
      # -- Parameters --
      # grant_type:    String
      # client_id:     String
      # client_secret: String

      # Returns:
      # access_token: String
      # token_type:   String
      # expires_in:   Number

      def authentication(client_id, client_secret, grant_type="client_credentials")
        conn = @client.post do |req|
          req.url '/oauth/access_token'
          req.body = { "grant_type": grant_type, "client_id": client_id, "client_secret": client_secret }
        end
        @token = "#{conn.body["token_type"]} #{conn.body["access_token"]}"
      end

    end
  end
end
