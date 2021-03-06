module Secured
    extend ActiveSupport::Concern

    SCOPES = {
      '/api/private-scoped' => ['read:messages'] # scopeが必要なrequestはこのように記載
    }

    included do
      before_action :authenticate_request!
    end

    def current_user
      @user
    end

    private

    def authenticate_request!
      @auth_payload, @auth_header = auth_token
      @user = User.from_token_payload(@auth_payload)

      render json: { errors: ['Insufficient scope'] }, status: :forbidden unless scope_included
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end

    def auth_token
      JsonWebToken.verify(http_token)
    end

    def scope_included
      # The intersection of the scopes included in the given JWT and the ones in the SCOPES hash needed to access
      # the PATH_INFO, should contain at least one element
      if SCOPES[request.env['PATH_INFO']] == nil
        true
      else
        (String(@auth_payload['scope']).split(' ') & (SCOPES[request.env['PATH_INFO']])).any?
      end
    end
end