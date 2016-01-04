module Tflow
  class ApiClient
    module Client
      # http://demo.tucannatflow.com/apidoc/#api-Client

      ### POST /api/v1/client/create

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # name: String
      # tflows: Object[]

      # Returns:
      # id:    Number
      # name:  String

      def create_client(name, tflows)
        conn = @client.post do |req|
          req.url '/api/v1/client/create'
          req.headers["Authorization"] = @token
          req.body = { "name": name, "tflows": tflows }
        end
        conn.body
      end

      ### GET /api/v1/client/:id

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
          req.url "/api/v1/client/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v1/client/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # name: String (optional)

      # Returns:
      # Array of Client objects

      def list_clients(name=nil)
        conn = @client.get do |req|
          req.url '/api/v1/client/list'
          req.headers["Authorization"] = @token
          req.body = { "name": name}
        end
        conn.body
      end

      ### GET /api/v1/client/:id/tflows

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Array of Tflow objects

      def get_client_tflows(id)
        conn = @client.get do |req|
          req.url "/api/v1/client/#{id}/tflows"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
