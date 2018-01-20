class AddNameToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :name, :string
  end
end
