class Ad < ApplicationRecord
  serialize :qr_code

  has_attached_file :image_asset, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
  }

  validates :name, uniqueness: { case_sensitive: false }, presence: true
  validates_presence_of :scaling
  validates_presence_of :image_asset
  validates_attachment_content_type :image_asset, content_type: /\Aimage\/.*\Z/

  after_create :generate_qr_code

  private

  def generate_qr_code
    uuid    = SecureRandom.uuid
    qr_code = RQRCode::QRCode.new(uuid)

    update_attribute(:qr_code, qr_code)
  end
end
