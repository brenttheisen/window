class Promo < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  validates :band_name, presence: true
end
