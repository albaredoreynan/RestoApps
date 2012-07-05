class ApplicationController < ActionController::Base
  attr_accessor :current_branch, :current_company, :current_setting

  protect_from_forgery

  before_filter :authenticate_client_user!
  before_filter :set_current_branch
  before_filter :set_current_company

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def set_current_branch
    if client_user_signed_in?
      @current_branch = current_client_user.branch
    end
  end

  def set_current_company
    if client_user_signed_in?
      @current_company = current_client_user.client
    end
  end

  def set_current_concept
    if client_user_signed_in?
      @current_concept = current_client_user.concept
    end
  end
  
  def set_current_setting
    if client_user_signed_in?
      @current_setting = current_company.setting
    end
  end

  #def after_sign_out_path_for(resource_or_scope)
    #scope = Devise::Mapping.find_scope!(resource_or_scope)
    #send(:"new_#{scope}_session_path")
  #end
  
  def after_sign_out_path_for(resource_or_scope)
    new_client_user_session_path
  end
  
end
