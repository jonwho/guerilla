class Ad < ApplicationRecord
  serialize :qr_code

  validates :name, uniqueness: { case_sensitive: false }, presence: true

  after_create :generate_qr_code

  private

  def generate_qr_code
    uuid    = SecureRandom.uuid
    qr_code = RQRCode::QRCode.new(uuid)

    update_attribute(:qr_code, qr_code)
  end
end
