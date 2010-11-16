Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, '9StzdbxHg33brjGvAddw2Q', 'ZACyz4fSVXz6GkgphOz060wHfSzAFUj6Ot0G20tvBZw'
#  provider :facebook, 'APP_ID', 'APP_SECRET'  
#  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
end  
