json.array!(@biz_promos) do |biz_promo|
  json.extract! biz_promo, :id, :business_name, :twitter_handle, :website_url, :facebook_url, :instagram_handle
  json.url biz_promo_url(biz_promo, format: :json)
end
