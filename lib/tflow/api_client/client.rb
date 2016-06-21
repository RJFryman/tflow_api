module Tflow
  class ApiClient
    module Client
      # http://demo.tucannatflow.com/apidoc/#api-Client

      ### POST /api/v2/client/create

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # name: String
      # tflow_ids: String[] (optional)
      # visible_to_instance_user_ids: Number[] (optional)
      # visible_to_non_instance_user_ids: Number[] (optional)

      # Returns:
      # id:    Number
      # name:  String

      def create_client(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/client/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      ### GET /api/v2/client/getInitialInfo
      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Information for creating new clients

      def get_client_initial_info
        conn = @client.get do |req|
          req.url '/api/v2/client/getInitialInfo'
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/client/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:    Number
      # name:  String

      def get_client(id)
        conn = @client.get do |req|
          req.url "/api/v2/client/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/client/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # name: String (optional)

      # Returns:
      # Array of Client objects

      def list_clients(json_payload={})
        conn = @client.get do |req|
          req.url "/api/v2/client/list?"
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      ### GET /api/v2/client/:id/tflows

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Array of Tflow objects

      def get_client_tflows(id)
        conn = @client.get do |req|
          req.url "/api/v2/client/#{id}/tflows"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
