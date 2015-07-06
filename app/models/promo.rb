class Promo < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "350x350#", thumb: "100x100>#" }, default_url: "default.png"
  validates_attachment_content_type :logo, { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates :band_name, presence: true
end
