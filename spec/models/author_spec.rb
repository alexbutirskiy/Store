require 'rails_helper'

RSpec.describe Author, type: :model do
  required_fields = %w(first_name last_name)
  optional_fields = %w(description)
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
  end

  context 'Associations' do
    it { should  have_many(:book_authors).dependent(:destroy) }
    it { should  have_many(:books).through(:book_authors) }
  end

  context 'Callbacks and methods' do
    it 'should have #full_name method' do
      author = build(:author)
      expect(author.full_name).to eq "#{author.first_name} #{author.last_name}"
    end
  end
end
