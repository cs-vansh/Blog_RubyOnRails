class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # these scopes will also allow us to filter it using BlogPost.draft, BlogPost.published, BlogPost.scheduled just like BlogPost.all works.
  # using lamda here so that Time.current is always evaluated at the time we are checking and not when the server was started.
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  # Will be first sorted based on published_at and if the value is same, then updated_at will be used
  # Based on published_at, the order will be descending: Scheduled, Published, Draft
  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }


  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
