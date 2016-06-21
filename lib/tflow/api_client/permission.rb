module Tflow
  class ApiClient
    module Permission

      # http://demo.tucannatflow.com/apidoc/#api-Job

      ### GET /api/v2/permission/list

      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Array of permission names defined in the systems

      def list_permissions
        conn = @client.get do |req|
          req.url "/api/v2/permission/list"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
