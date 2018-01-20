class AddImageAssetToAd < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :ads, :image_asset
  end

  def self.down
    remove_attachment :ads, :image_asset
  end
end
