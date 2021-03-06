class InformationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  before_action :myitem?, only: [:edit, :update, :destroy]

  # GET /information
  # GET /information.json
  def index
    @information = Information.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /information/1
  # GET /information/1.json
  def show
    unless @information.user_id == current_user.id
      unless @information.general
        redirect_to top_show_path
      end
    end
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(information_params)

    @information_form = @information

    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, success: '投稿しました' }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    @information_form = @information

    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, success: '編集しました' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, success: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:title, :comment, :general).merge(user_id: current_user.id)
    end

    def myitem?
      unless @information.user_id == current_user.id
        redirect_to top_show_path
      end
    end


end
