module Tflow
  class ApiClient
    module Revision
      # http://demo.tucannatflow.com/apidoc/#api-Revision

      def delete_revision(id)
        conn = @client.delete do |req|
          req.url "/api/v2/revision/#{id}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      def download_preview_image(id, pageNo)
        conn = @client.get do |req|
          req.url "/api/v2/revision/#{id}/preview/#{pageNo}"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/revision/:id/lowresFile

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Download lowres File

      def download_lowres_pdf(id)
        conn = @client.get do |req|
          req.url "/api/v2/revision/#{id}/lowresFile"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/revision/:id/originalFile

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Download original File

      def download_original_file(id)
        conn = @client.get do |req|
          req.url "/api/v2/revision/#{id}/originalFile"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/revision/:id/preflightedPdf

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Download preflighted Pdf

      def download_preflighted_pdf(id)
        conn = @client.get do |req|
          req.url "/api/v2/revision/#{id}/preflightedPdf"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

      ### GET /api/v2/revision/:id/proof

      # Requires:
      # -- Header --
      # access_token:  String
      # -- Parameters --
      # id: String

      # Returns:
      # Download proof pdf

      def download_proof_pdf(id)
        conn = @client.get do |req|
          req.url "/api/v2/revision/#{id}/proof"
          req.headers["Authorization"] = @token
        end
        conn.body
      end

    end
  end
end
