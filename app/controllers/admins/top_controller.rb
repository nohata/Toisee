class Admins::TopController < ApplicationController
  before_action :authenticate_admin!

  # GET /admins/top
  # GET /admins/top.json
  def index
  end


end