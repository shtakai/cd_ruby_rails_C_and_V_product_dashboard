class Comment < ActiveRecord::Base
  validates :comment, presence: true
  validates :comment, length: { minimum: 10 }

  belongs_to :product
end
