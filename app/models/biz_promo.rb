class BizPromo < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  validates :business_name, presence: true
end
