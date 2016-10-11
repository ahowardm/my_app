if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
elseif Rails.env.development?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
end
