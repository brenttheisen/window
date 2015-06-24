require 'clockwork'
require './config/boot'
require './config/environment'
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end


# ______Tweeting Bands________
every(24.hours, 'Tweet Band Info') {
    `rake tweet:band`
  }

  # ______Tweeting Business
every(24.hours, 'Tweet Band Info') {
    `rake tweet:biz`
  }

end