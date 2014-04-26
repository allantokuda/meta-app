class ObjectsController < ApplicationController
  before_action :lookup, only: [:show, :update, :destroy]

  def index
    @objects = object_type.all
    render json: @objects
  end

  def show
    render json: @object
  end

  def create
    @object = object_type.new(object_params)

    if @object.save
      render json: @object, status: :created
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def update
    if @object.update(object_params)
      head :no_content
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @object.destroy
    head :no_content
  end

  private

  def object_type
    eval(object_type_str)
  end

  def object_type_str
    self.class.to_s.gsub('Controller','').split('::').last.singularize
  end

  def object_type_sym
    object_type_str.downcase.to_sym
  end

  def permitted_params
    object_type.try(:fields).keys.map(&:to_sym).reject{|k| k == :_id}
  end

  def lookup
    @object = object_type.find(params[:id])
  end

  def object_params
    params.require(object_type_sym).permit(*permitted_params)
  end
end
