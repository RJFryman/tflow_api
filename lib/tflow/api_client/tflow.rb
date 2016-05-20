module Tflow
  class ApiClient
    module Tflow
      # http://demo.tucannatflow.com/apidoc/#api-Tflow

      ### GET /api/v1/tflow/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:          Number
      # tflow_name:  String
      # queue_name:  String

      def get_tflow(id)
        conn = @client.get do |req|
          req.url "/api/v1/tflow/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v1/tflow/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # tflow_name: String (optional)
      # queue_name: String (optional)

      # Returns:
      # Array of Tflow objects

      def list_tflows(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v1/tflow/list?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

    end
  end
end
