twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

#Login: windowsofworlds
#Pass: lotsofjunk

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


namespace :payout do 
  desc "Payout"
  task all: :environment do
    bal = Stripe::Balance.retrieve().available[0].amount
    if bal > 0
      freds15 = (bal * 15) / 100
      wow85 = bal - freds15
      
      Stripe::Transfer.create(
        :amount => freds15,
        :currency => "usd",
        :recipient => 'rp_16LJ6xHmGrqXGSKneRTKsnRN',
        :description => "Transfer for Fred 15% ownership of Windows of Worlds"
      )
      # git commit -m 'procfile added, tweets are configured but not live, my 15% payout is live need to configure for 100states 85%'

      Stripe::Transfer.create(
        :amount => wow85,
        :currency => "usd",
        :recipient => 'rp_16KwYzHmGrqXGSKnBruq6ufY',
        :description => "Transfer for 100State 85% ownership of Windows of Worlds"
      )
      puts "Payout Complete"
    else
      puts "No Payout This Week"
    end
    puts "Transfers Completed"
  end
end