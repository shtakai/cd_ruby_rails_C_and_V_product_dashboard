class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :category

  end
end
