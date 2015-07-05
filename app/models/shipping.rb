class Shipping < ActiveRecord::Base
  validates :address, :email, :name, presence: true
end
