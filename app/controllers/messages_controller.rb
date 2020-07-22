class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    @notdog = Notdog.find(params[:notdog_id])
    authorize @message
    authorize @notdog
  end

  def create
    @message = Message.new(message_params)
    @notdog = Notdog.find(params[:notdog_id])
    @message.notdog = @notdog
    @message.user = current_user
    authorize @message

    if @message.save!
      redirect_to notdog_path(@notdog)
    else
      render :new
    end
  end


  def edit
    @notdog = Notdog.find(params[:notdog_id])
    @message = Message.find(params[:id])
    @message.notdog = @notdog
    authorize @message
  end

  def update
    @notdog = Notdog.find(params[:notdog_id])
    @message = Message.find(params[:id])
    @message.update(message_params)
    authorize @message

    if @message.save
      redirect_to @notdog
    else
      render :edit
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :notdog_id, :answer, :id)
  end


end
