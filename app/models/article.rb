class Article
  belongs_to :library

  validates :url, presence: true

end