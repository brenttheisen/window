json.array!(@promos) do |promo|
  json.extract! promo, :id, :twitter_handle, :band_name, :youtube_channel, :website_link, :itunes_link, :soundcloud_link, :fb_link, :insta_link
  json.url promo_url(promo, format: :json)
end
