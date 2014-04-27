require 'spec_helper'

describe ObjectsController do

  before do
    module ExampleModule
      class ExampleModelsController < ObjectsController; end
    end
    class ExampleModel; end
    class ParentModel; end
    @controller = ExampleModule::ExampleModelsController.new
  end

  describe '#model' do
    it 'looks up a data model by naming conventions' do
      @controller.model.should == ExampleModel
    end
  end

  describe '#model_symbol' do
    it 'returns the singular model name as a symbol' do
      @controller.model_symbol.should == :example_model
    end
  end

  describe '#model_symbol_plural' do
    it 'returns the plural model name as a symbol' do
      @controller.model_symbol_plural.should == :example_models
    end
  end

  describe '#parent_model' do
    before do
      @controller.request = double(
        "request", :env => {
          'PATH_INFO' => path
        }
      )
    end

    context 'when a parent model is specified' do
      let(:path) { '/api/v1/parent_model/123/example_model' }
      it 'returns the parent model of the request' do
        @controller.parent_model.should == ParentModel
      end
    end

    context 'when a parent model is not specified' do
      let(:path) { '/api/v1/example_model/123' }
      it 'returns nil' do
        @controller.parent_model.should == nil
      end
    end
  end
end
