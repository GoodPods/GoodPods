class ApiController < ApplicationController

  #before_action :authenticate

  private
  def client_id ; @_client_id ||= (params[:client_id] || request.headers["HTTP_CLIENT_ID"] || NullClientId) ; end

  def authenticate
    unless client_id.to_s.eql? $CLIENT_ID
      @api = {
        greetings: "🖖 ❤️",
        season: "🍃",
        unlock: "🔑 to get access to our full API email goodpods@gmail.com to get a client_id"
      }
      render json: @api, status: 401
    end
  end
end
