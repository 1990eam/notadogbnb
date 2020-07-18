class NotdogsController < ApplicationController
  before_action :set_notdog, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @notdogs = policy_scope(Notdog)
  end

  def show; end

  def new
    @notdog = Notdog.new
    authorize @notdog
  end

  def create
    @notdog = Notdog.new(notdog_params)
    @notdog.owner = current_user
    authorize @notdog

    if @notdog.save!
      redirect_to @notdog
    else
      render :new
    end
  end

  def edit; end

  def update
    @notdog.update(notdog_params)

    if @notdog.save
      redirect_to @notdog
    else
      render :edit
    end
  end

  def destroy
    @notdog.destroy
    redirect_to notdogs_path
  end

  private

  def notdog_params
    # estos parametros se usan tanto para crear como para updatear un notdog
    params.require(:notdog).permit(:name, :cost_per_day, :description, :address, :taxonomy_name, :taxonomy_category, :taxonomy_fantasy_name, :photo)
  end

  def set_notdog
    @notdog = Notdog.find(params[:id])
    authorize @notdog
  end

end
