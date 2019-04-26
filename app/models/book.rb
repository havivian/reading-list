class Book
  belongs_to :library

  validates :title, :author, { presence: true }

end
