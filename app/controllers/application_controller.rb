class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if session[:return_to]
      session[:return_to]
    else
      super
    end
  end

  def authenticate_user!
    if !user_signed_in?
      store_unauthenticated_input
      generate_redirect_path
    end
    super
  end

  #may want to dry up the params assignment w/ an each method
  def store_unauthenticated_input
    session[:invite_uid] = params[:invite_uid] if params[:invite_uid]
    session[:classroom_uid] = params[:classroom_id] if params[:classroom_id]
  end

  def generate_redirect_path
  	if session[:classroom_uid]
    	redirect_path = new_classroom_membership_path(session[:classroom_uid])
    end
    session[:return_to] = redirect_path
  end
end
