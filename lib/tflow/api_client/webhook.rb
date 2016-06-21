module Tflow
  class ApiClient
    module Webhook

      def create_webhook(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/webhook/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def delete_webhook(name)
        conn = @client.delete do |req|
          req.url "/api/v2/webhook/#{name}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def get_webhook(name)
        conn = @client.get do |req|
          req.url "/api/v2/webhook/#{name}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def list_webhooks(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v2/webhook/list?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      def update_webhook(name)
        conn = @client.post do |req|
          req.url "/api/v2/webhook/#{name}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
