class Promo < ActiveRecord::Base
  validates :band_name, presence: true
  mount_uploader :logo, LogoUploader
end
