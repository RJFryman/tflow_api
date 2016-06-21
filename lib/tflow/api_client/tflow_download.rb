module Tflow
  class ApiClient
    module TflowDownload

      def list_ready_jobs(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v2/tflowDownload/checkReady?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      def set_download_state(id, json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/tflowDownload/checkReady'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end


    end
  end
end
