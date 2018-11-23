class SeasController < ApplicationController
  #define your controller actions here
  before_action :set_sea, only: [:show, :edit, :update, :destroy]

  def index
    @seas = Sea.all
  end

  def show
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.create(sea_params)
    render "show"
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea.update(sea_params)
    render "show"
  end

  def destroy
    @sea.destroy
    redirect_to seas_path
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def set_sea
    @sea = Sea.find(params[:id])
  end

end
