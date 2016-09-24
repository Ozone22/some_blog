class Admin::AdminBaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!

  before_action :admin_user

  include Admin::CategoriesHelper

  private

  def admin_user
    unless current_user.admin?
      flash[:notice] = I18n.t('error_messages.access_error')
      redirect_to root_path
    end
  end

end
