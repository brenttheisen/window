twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

Stripe.api_key = ENV['SECRET_KEY_LIVE']

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
  namespace :all do 
    bal = Stripe::Balance.retrieve().available[0].amount
    if bal > 0
      task fred: :environment do
        freds15 = (bal * 15) / 100
        Stripe::Transfer.create(
          :amount => freds15,
          :currency => "usd",
          :recipient => 'rp_16LJ6xHmGrqXGSKneRTKsnRN',
          :description => "Fred 15% ownership of Windows of Worlds"
        )
        puts "Payout TO Fred"
      end
      task wow: :environment do
        Stripe::Transfer.create(
          :amount => bal,
          :currency => "usd",
          :recipient => 'rp_16KwYzHmGrqXGSKnBruq6ufY',
          :description => "100State 85% ownership of Windows of Worlds"
        )
        puts "Payout To WOW"
      end
    else
      puts "No Payout"
    end
      puts "Transfers Completed"
  end
end


namespace :scrape do
  task arts_gov: :environment do
    scrape = Wombat.crawl do
      base_url "http://arts.gov"
      path "/partners/state-regional"

      results "xpath=//*[@id='node-page-14015']/div[1]/div/div/div/p", :iterator do
        company "xpath=a/strong"
        link "xpath=a/@href"
        email "xpath=a[2]/@href"
      end
    end
    scrape['results'].each do |company|
      if !company['company'].nil? && !company['link'].nil? && !company['email'].nil?
        Company.create!(company: company['company'], link: company['link'], email: company['email'].gsub("mailto:", ''))
      end
    end
  end

  task wiki: :environment do
    scrape = Wombat.crawl do
      base_url "https://en.wikipedia.org"
      path "/wiki/Category:Arts_organizations_based_in_the_United_States"

      company({xpath: '//*[@id="mw-pages"]/div/div/div/ul/li/a'}, :list)
    end
    scrape['company'].each do |company|
      Company.find_or_create_by(company: company) 
    end
  end

  task si: :environment do
    scrape = Wombat.crawl do
      base_url "http://www.si.edu"
      path "/mci/english/learn_more/taking_care/artorgs.html"

      results 'xpath=//*[@id="site_sections"]/p', :iterator do
        company 'css=a'
        link 'css=a/@href'
      end
    end
    scrape['results'].each do |company|
      if !company['company'].nil? && !company['link'].nil?
        Company.create!(company: company['company'], link: company['link'])
      end
    end
  end

  task nas: :environment do
    scrape = Wombat.crawl do
      base_url "http://thejustinwayneshow.com"
      path "/about/artists/"

      results "xpath=//*[@class='linkcat']/div/ul/li", :iterator do
        company "xpath=a"
        link 'xpath=a/@href'
      end
    end
    scrape['results'].each do |company|
      if !company['company'].nil? && !company['link'].nil?
        Company.create!(company: company['company'], link: company['link'])
      end
    end
  end
end
