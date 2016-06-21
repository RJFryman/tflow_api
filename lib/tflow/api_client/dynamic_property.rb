module Tflow
  class ApiClient
    module DynamicProperties

      # http://demo.tucannatflow.com/apidoc/#api-Job

      ### GET /api/v2/prop/:entityType

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # entityType: String (optional)

      # Returns:
      # Get definitions for dynamic properties

      def get_dynamic_properties(entity_type)
        conn = @client.get do |req|
          req.url "/api/v2/prop/#{entity_type}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
