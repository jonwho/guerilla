class AddScalingToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :scaling, :float
  end
end
