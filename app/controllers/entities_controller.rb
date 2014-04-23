class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = Entity.all
    render json: @entities
  end

  def show
    render json: @entity
  end

  def create
    @entity = Entity.new(entity_params)

    if @entity.save
      render json: @entity, status: :created
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entity.update(entity_params)
      head :no_content
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:name)
    end
end
