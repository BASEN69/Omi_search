class ApplicationController < ActionController::Base
  before_action :configure_authentication

  private

  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admins'
  end

  def action_is_public?
    public_actions = {
      'homes' => ['top', 'about'],
      'posts' => ['index', 'show'],
      'genres' => ['show'],
      'users' => ['show'],
    }
    public_actions[controller_name]&.include?(action_name)
  end
end

