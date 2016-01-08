require 'rails_helper'

RSpec.describe Book, type: :model do
  required_fields = %w(title price)
  optional_fields = %w(short_description full_description)
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
    it { should have_many(:book_authors).dependent(:destroy) }
    it { should have_many(:authors).through(:book_authors) }
    it { should belong_to(:category) }
  end

  context 'Callbacks and methods' do
    it 'should have #author_names method' do
      author1 = build(:author)
      author2 = build(:author)
      book = build(:book)
      book.authors << author1 << author2
      expect(book.author_names).to eq "#{author1.full_name}, #{author2.full_name}"
    end
  end
end
