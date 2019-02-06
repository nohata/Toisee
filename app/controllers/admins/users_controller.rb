class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  # GET /admins/users
  # GET /admins/users.json
  def index

    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)

  end

  # DELETE /admins/user/1
  # DELETE /admins/user/1.json
  def destroy

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admins_users_path, success: '削除しました' }
      format.json { head :no_content }
    end

  end

end