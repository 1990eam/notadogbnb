class NotdogsController < ApplicationController
  before_action :set_notdog, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_notdogs]

  def index
    if params[:query].present?
      sql_query = " \
      notdogs.taxonomy_name @@ :query \
      OR notdogs.taxonomy_category @@ :query \
      OR notdogs.address @@ :query \
      OR notdogs.name @@ :query \
      "
      @notdogs = policy_scope(Notdog).where(sql_query, query: "%#{params[:query]}%").geocoded
      @markers = @notdogs.map do |notdog|
        {
          lat: notdog.latitude,
          lng: notdog.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { notdog: notdog }),
          image_url: helpers.asset_url('notdog-marker.png')
        }
        end
        # No encuentra resultados para la query
      if @notdogs.empty?
        @notdogs = policy_scope(Notdog).order(name: :asc).geocoded
        @markers = @notdogs.map do |notdog|
          {
            lat: notdog.latitude,
            lng: notdog.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { notdog: notdog }),
            image_url: helpers.asset_url('notdog-marker.png')
          }
        end
      end
      # No hay query
    else
      @notdogs = policy_scope(Notdog).order(name: :asc).geocoded
      @markers = @notdogs.map do |notdog|
        {
          lat: notdog.latitude,
          lng: notdog.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { notdog: notdog }),
          image_url: helpers.asset_url('notdog-marker.png')
        }
      end
    end
  end

    def show
      @markers =
      [{
        lat: @notdog.latitude,
        lng: @notdog.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { notdog: @notdog }),
        image_url: helpers.asset_url('notdog-marker.png')
      }]
    # Q&A
    @messages = @notdog.messages
    @reviews = @notdog.reviews
  end

  def new
    @notdog = Notdog.new
    authorize @notdog
  end

  def create
    @notdog = Notdog.new(notdog_params)
    @notdog.taxonomy_category = notdog_params[:taxonomy_category].drop(1).join(", ")
    @notdog.owner = current_user
    authorize @notdog
    if @notdog.save
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

  def my_notdogs
    @notdogs = current_user.notdogs
  end

  private

  def notdog_params
    # estos parametros se usan tanto para crear como para updatear un notdog
    params.require(:notdog).permit(:name, :cost_per_day, :description, :address, :taxonomy_name, :taxonomy_fantasy_name, :photo, taxonomy_category: [])
  end

  def set_notdog
    @notdog = Notdog.find(params[:id])
    authorize @notdog
  end
end
