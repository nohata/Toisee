class TopController < ApplicationController
    before_action :sign_in_required, only: [:show]

  # GET /top
  # GET /top.json
  def index
    redirect_to top_show_path if user_signed_in?
  end

  # GET /top/1
  # GET /top/1.json
  def show
    @information = Information.where(general: true).order(created_at: :desc).page(params[:page]).per(10)
  end

end