class BizPromo < ActiveRecord::Base
  validates :business_name, presence: true
  mount_uploader :logo, LogoUploader
end
