class NotdogsController < ApplicationController
  before_action :set_notdog, only: [:show, :edit, :update]
  def index
    @notdogs = policy_scope(Notdog)
  end

  def show
  end

  def new
    @notdog = Notdog.new
    authorize @notdog
  end

  def create
    @notdog = Notdog.new(notdog_params)
    @notdog.user = current_user
    authorize @notdog
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def notdog_params
    params.require(:notdog).permit(:name, :cost_per_day, :description, :address)
  end

  def set_notdog
    @notdog = Notdog.find(params[:id])
    authorize @notdog
  end
end
