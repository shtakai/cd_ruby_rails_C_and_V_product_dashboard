class Product < ActiveRecord::Base
  validates :name, :description, :pricing, presence: true
  validates :name, :description, length: { minimum: 5 }
end
