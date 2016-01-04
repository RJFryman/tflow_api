module Tflow
  class ApiClient
    module Role
      # http://demo.tucannatflow.com/apidoc/#api-Role

      ### GET /api/v1/role/list

      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Array of role names defined in the system

      def list_roles
        conn = @client.get do |req|
          req.url '/api/v1/role/list'
          req.headers["Authorization"] = @token
        end
        conn.body
      end
      
    end
  end
end
