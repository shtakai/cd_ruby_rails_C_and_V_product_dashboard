class Product < ActiveRecord::Base
  validates :name, :description, :pricing, presence: true
  validates :name, :description, length: { minimum: 5 }
  validates :pricing, numericality: {greater_than: 0.00}

  belongs_to :category
end
