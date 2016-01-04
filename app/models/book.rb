class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  # #author_names returns a string with author full_names devided by ", "
  def author_names
    self.authors.inject('') do |str, author|
      str << ', ' unless str.empty?
      str << author.full_name
    end
  end
end
