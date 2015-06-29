require 'clockwork'
require './config/boot'
require './config/environment'
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


# # ______Tweeting Bands
# every(24.hours, 'Tweet Band Info') {
#     `rake tweet:band`
#   }

# # ______Tweeting Business
# every(24.hours, 'Tweet Band Info') {
#     `rake tweet:biz`
#   }

# ______Payout
every(1.week, 'Payout') {
    `rake payout:all`
  }

end