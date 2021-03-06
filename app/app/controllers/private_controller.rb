#Auth0が機能しているか確認するためのcontroller.
class PrivateController < ActionController::Base
    include Secured
    def private
      render json: { message: 'Hello from a private endpoint! You need to be authenticated to see this.', user: current_user.id}
    end

    def private_scoped
      render json: { message: 'Hello from a private endpoint! You need to be authenticated and have a scope of read:messages to see this.' }
    end
end