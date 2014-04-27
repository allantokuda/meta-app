class ObjectsController < ApplicationController
  before_action :lookup_object, only: [:show, :update, :destroy]
  before_action :lookup_parent, only: [:index, :create]

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

  def parent_model
    parent_model_name.camelcase.constantize if parent_model_name
  end

  def parent_model_name
    path = request.env['PATH_INFO'].split('/')
    path[3].singularize if path[3] && path[5]
  end

  def siblings
    @parent.public_send(model_symbol_plural)
  end

  def index
    if parent_model
      objects = siblings.all
    else
      objects = model.all
    end
    render json: objects
  end

  def create
    object = model.new(object_params)

    if parent_model
      siblings << object
      topic = @parent
    else
      topic = object
    end

    if topic.save
      render json: topic, status: :created
    else
      render json: topic.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @object
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

  def lookup_object
    @object = lookup(model)
  end

  def lookup_parent
    @parent = lookup(parent_model) if parent_model
  end

  def lookup(subject)
    begin
      @object = subject.find(params[:id])
    rescue Mongoid::Errors::DocumentNotFound => e
      render json: { errors: "#{subject} id #{params[:id]} not found" }, status: :not_found
    end
  end

  def object_params
    params.require(model_symbol).permit(*model.non_id_fields)
  end
end
