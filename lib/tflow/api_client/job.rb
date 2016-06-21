module Tflow
  class ApiClient
    module Job
      # http://demo.tucannatflow.com/apidoc/#api-Job

      def clear_rush_request_job(id)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/rush/clear"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### POST /api/v2/job/create

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # name: String (optional)
      # description: String (optional)
      # notes: String (optional)
      # order_id: Number (optional)
      # ship_date: String
      # kfpx: String (optional)
      # priority: Number
      # attach_proofs: Boolean
      # assignments: Object (optional)
      # tflows: Object[] (optional)
      # props: Object

      # Returns:
      # Job Object

      def create_job(json_payload)
        conn = @client.post do |req|
          req.url '/api/v2/job/create'
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

      def delete_job(id)
        conn = @client.delete do |req|
          req.url "/api/v2/job/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### POST /api/v2/job/:id/executeTransition
      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String
      # transition_name: String

      def executeTransition(id, transition_name)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/executeTransition"
          req.headers["Authorization"] = @token
          req.body = { "transition_name": transition_name}
        end
        conn.body
      end

      ### GET /api/v2/job/:id

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # id:          Number

      def get_job(id)
        conn = @client.get do |req|
          req.url "/api/v2/job/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/job/list

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # order_id: String (optional)
      # job_name: String (optional)

      # Returns:
      # Array of Tflow objects

      def list_jobs(json_payload={})
        conn = @client.get do |req|
          req.url '/api/v2/job/list?'
          req.headers["Authorization"] = @token
          req.params = json_payload
        end
        conn.body
      end

      ### GET /api/v2/job/:id/allowedTransitions

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Array of Array of transition names

      def list_job_transitions(id)
        conn = @client.get do |req|
          req.url "/api/v2/job/#{id}/allowedTransitions"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/job/:id/revisions

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Array of Array of revisions object

      def list_job_revisions(id)
        conn = @client.get do |req|
          req.url "/api/v2/job/#{id}/revisions"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def re_preflight(id)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/repreflight"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def set_rush_job(id)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/rush/request"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def undo_rush_request(id)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/rush/undoRequest"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def update_job(id, json_payload)
        conn = @client.post do |req|
          req.url "/api/v2/job/#{id}/update"
          req.headers["Authorization"] = @token
          req.body = json_payload
        end
        conn.body
      end

    end
  end
end
