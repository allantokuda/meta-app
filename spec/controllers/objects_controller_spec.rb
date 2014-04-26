require 'spec_helper'

describe ObjectsController do

  before do
    module ExampleModule
      class ExampleObjectsController < ObjectsController; end
    end
    class ExampleObject; end
    @controller = ExampleModule::ExampleObjectsController.new
  end

  describe '#model' do
    it 'looks up a data model by naming conventions' do
      @controller.model.should == ExampleObject
    end
  end

  describe '#model_symbol' do
    it 'returns the singular model name as a symbol' do
      @controller.model_symbol.should == :example_object
    end
  end

  describe '#model_symbol_plural' do
    it 'returns the plural model name as a symbol' do
      @controller.model_symbol_plural.should == :example_objects
    end
  end
end
