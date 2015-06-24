twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

namespace :tweet do 
  desc "Tweet Band Info"
  task band: :environment do
    band = Promo.order('RANDOM()').first
    tweet = "S/O #{band.twitter_handle} #{band.website_link} #{band.band_name} "
    twitter.update(tweet.truncate(140, omission: ''))
    puts "Tweeted Band Info"
  end
  
  desc "Tweet Business Info"
  task biz: :environment do
    biz = BizPromo.order('RANDOM()').first
    tweet = "S/O #{biz.twitter_handle} #{biz.website_link} #{biz.band_name} "
    twitter.update(tweet.truncate(140, omission: ''))
    puts "Tweeted Business Info"
  end
end