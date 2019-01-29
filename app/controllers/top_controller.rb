class TopController < ApplicationController
    before_action :sign_in_required, only: [:show]

  # GET /top
  # GET /top.json
  def index
  end

  # GET /top/1
  # GET /top/1.json
  def show
    @information = Information.where(general: true)
  end

end