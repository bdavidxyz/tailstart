class Account::SessionsController < ApplicationController

  before_action :set_session, only: :destroy

  def index
    @sessions = Current.user.sessions.order(created_at: :desc)
  end

  def destroy
    @session.destroy; redirect_to(account_sessions_path, notice: "That session has been logged out")
  end

  private
    def set_session
      @session = Current.user.sessions.find(params[:id])
    end
  
end
