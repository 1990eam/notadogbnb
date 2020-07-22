class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    @notdog = Notdog.find(params[:notdog_id])
    authorize @message
    authorize @notdog
  end

  def create

  end


end
