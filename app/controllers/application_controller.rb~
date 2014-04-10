class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  #rescue_from ActionView::TemplateError, :with => :render_404

  #rescue_from ActionController::RoutingError, :with => :render_404

  #rescue_from ActionController::UnknownController, :with => :render_404

 # rescue_from ActionController::MethodNotAllowed, :with => :render_404

 # rescue_from ActionController::InvalidAuthenticityToken, :with => :render_404

 # if Rails.env.production?
 #   rescue_from ActionController::UnknownAction, :with => :render_404
 # end


    def render_404
    render file: "public/404.html", status: 404
  end

  def render_200
    render file: "public/200.html", status: 200
  end

  protect_from_forgery with: :exception
end
