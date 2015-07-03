class Shipping < ActiveRecord::Base
  validates :address, :email, presence: true
end
