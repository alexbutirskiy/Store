require 'rails_helper'

RSpec.describe Category, type: :model do
  required_fields = %w(name)

  required_fields ||= []
  optional_fields ||= []
  fields = required_fields + optional_fields

  context 'Attributes' do
    fields.each do |attribute|
      it { should have_db_column(attribute) }
      it { should respond_to(attribute) }
    end
  end

  context 'Validations' do
    required_fields.each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_uniqueness_of(:name) }

    it { should have_many(:books).dependent(:nullify) }
  end
end
