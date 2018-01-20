class Ad < ApplicationRecord
  serialize :qr_code

  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
