class Admins::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
end
