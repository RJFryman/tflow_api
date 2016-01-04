module Tflow
  class ApiClient
    module Workgroup
      # http://demo.tucannatflow.com/apidoc/#api-Workgroup

      ### GET /api/v1/workgroup/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:                Number
      # name:              String
      # description:       String
      # owning_client_id:  Number

      def get_workgroup(id)
        conn = @client.get do |req|
          req.url "/api/v1/workgroup/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v1/workgroup/list

      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Array of Workgroup objects

      def list_workgroups
        conn = @client.get do |req|
          req.url '/api/v1/workgroup/list'
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
