class Author < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  # full_name returns a string with first_name and last_name
  def full_name
    first_name + ' ' + last_name
  end
end
