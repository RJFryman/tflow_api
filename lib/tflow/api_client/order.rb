module Tflow
  class ApiClient
    module Order
      # http://demo.tucannatflow.com/apidoc/#api-Order

      ### POST /api/v2/order/create

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # client_id: Number (optional)
      # name: String (optional)
      # description: String (optional)
      # ship_date: String
      # kfpx: String (optional)
      # assignments: Object (optional)
      # tflows: Object[] (optional)
      # props: Object

      # Returns:
      # Order Object

      def create_order(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/order/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def delete_order(id)
        conn = @client.delete do |req|
          req.url "/api/v2/job/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/order/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:          Number
      # tflow_name:  String
      # queue_name:  String

      def get_order(id)
        conn = @client.get do |req|
          req.url "/api/v2/order/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/order/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # tflow_name: String (optional)
      # queue_name: String (optional)

      # Returns:
      # Array of Tflow objects

      def list_orders(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v2/order/list?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      def update_order(id, json_payload)
        conn = @client.post do |req|
          req.url "/api/v2/order/#{id}/update"
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

    end
  end
end
