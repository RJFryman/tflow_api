module Tflow
  class ApiClient
    module Product

      # http://demo.tucannatflow.com/apidoc/#api-Product

      ### GET /api/v2/product/list

      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Array of permission names defined in the systems

      def list_products(json_payload={})
        conn = @client.get do |req|
          req.url "/api/v2/product/list"
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

    end
  end
end
