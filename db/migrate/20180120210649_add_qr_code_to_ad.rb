class AddQrCodeToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :qr_code, :text
  end
end
