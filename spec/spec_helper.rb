require File.expand_path("../../lib/mock_redis", __FILE__)

RSpec.configure do |config|
  config.before(:each) do
    @redis = MockRedis.new
    @redis.flushdb
  end
end
