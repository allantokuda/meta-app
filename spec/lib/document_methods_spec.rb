require 'spec_helper'

describe DocumentMethods do
  it 'allows a document model to list its non-id fields' do
    class ExampleModel
      include Mongoid::Document
      extend DocumentMethods
      field :field1, type: :string
      field :field2, type: :string
    end

    expect(ExampleModel.non_id_fields).to eq([:field1, :field2])
  end
end
