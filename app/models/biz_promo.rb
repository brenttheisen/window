class BizPromo < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300#", thumb: "100x100>#" }, default_url: "https://cdn3.iconfinder.com/data/icons/abstract-1/512/no_image-512.png"
  validates_attachment_content_type :logo, { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates :business_name, :logo, presence: true
end
