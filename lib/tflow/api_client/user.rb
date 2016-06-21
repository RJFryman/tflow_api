module Tflow
  class ApiClient
    module User
      # http://demo.tucannatflow.com/apidoc/#api-User

      ### POST /api/v2/user/create

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # email: String
      # password: String
      # client_id: Number
      # name: String
      # phonenumber: String (optional)
      # enabled: Boolean
      # locale: String
      # workgroups: Object[]
      # id: Number
      # alertTypes: String[]

      # Returns:
      # User Object

      def create_user(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/user/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      ### GET /api/v2/user/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:         Number
      # email:      String
      # client_id:  Number
      # name:       String
      # enabled:    Boolean
      # locale:     String

      def get_user(id)
        conn = @client.get do |req|
          req.url "/api/v2/user/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/user/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # email: String (optional)

      # Returns:
      # Array of User objects

      def list_users(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v2/user/list?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      def update_user(id, json_payload)
        conn = @client.post do |req|
          req.url "/api/v2/user/#{id}"
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

    end
  end
end
