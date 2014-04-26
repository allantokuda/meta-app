class ObjectsController < ApplicationController
  before_action :lookup, only: [:show, :update, :destroy]
  #before_action :lookup_parent_and_siblings, only: [:nested_index, :create]

  def model
    model_name.camelcase.constantize
  end

  def model_name
    self.class.to_s.gsub('Controller','').split('::').last.singularize
  end

  def model_symbol
    model_name.underscore.to_sym
  end

  def model_symbol_plural
    model_name.underscore.pluralize.to_sym
  end

  def index
    @objects = model.all
    render json: @objects
  end

  #def nested_index
  #  render json: @sibling_objects
  #end

  def show
    render json: @object
  end

  def create
    @object = model.new(object_params)

    if @object.save
      render json: @object, status: :created
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  #def create
  #  @object = model.new(object_params)

  #  @sibling_objects << @object

  #  if @parent_object.save
  #    render json: @object, status: :created
  #  else
  #    render json: @object.errors, status: :unprocessable_entity
  #  end
  #end

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

  #private

  def lookup
    @object = model.find(params[:id])
  end

  #def lookup_parent_and_siblings
  #  @parent_object = parent_model.find(params[:id])
  #  @sibling_objects = @parent_object.public_send(model_symbol_plural)
  #end

  def object_params
    params.require(model_symbol).permit(*permitted_params)
  end

  def permitted_params
    [:name]
  end
  #def permitted_params
  #  model.try(:fields).keys.map(&:to_sym).reject{|k| k == :_id}
  #end

  #def parent_model
  #  parent_model_name.camelcase.constantize
  #end

  #def parent_model_name
  #  request.env['PATH_INFO'].split('/')[3].singularize
  #end
end
