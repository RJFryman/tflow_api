module Tflow
  class ApiClient
    module Role
      # http://demo.tucannatflow.com/apidoc/#api-Role

      def create_role(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/role/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def get_role(id)
        conn = @client.get do |req|
          req.url "/api/v2/role/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def get_assigned_users(id, json_payload={})
        conn = @client.get do |req|
          req.url "/api/v2/role/#{id}/getUsers"
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      ### GET /api/v2/role/list

      # Requires:
      # -- Header --
      # access_token:  String

      # Returns:
      # Array of role names defined in the system

      def list_roles
        conn = @client.get do |req|
          req.url '/api/v2/role/list'
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def get_permissions
        conn = @client.get do |req|
          req.url '/api/v2/role/getPermissions'
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def get_workflow_permissions
        conn = @client.get do |req|
          req.url '/api/v2/role/getWorkflowPermissions'
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def set_assigned_users(id, json_payload)
        conn = @client.post do |req|
          req.url "/api/v2/role/#{id}/setUsers"
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def set_role_permissions(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/role/setPermissions'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def set_workflow_permisions(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/role/setWorkflowPermissions'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def update_role(id, json_payload)
        conn = @client.post do |req|
          req.url "/api/v2/role/#{id}"
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

    end
  end
end
