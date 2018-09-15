class PagesController < ApplicationController
  skip_before_action :is_admin?
end
