# Mock Redis

A little class that acts like redis-rb, but for testing on machines without redis.

Based on (https://github.com/jayferd/mock_redis) but with some improvments like the Zset type (with some specs) and gemification.

## Usage

redis = MockRedis.new

now pretend redis is a redis client.

See (http://github.com/ezmobius/redis-rb) for more details about the client and [Redis command list](http://redis.io/commands)

## Authors

[Jay Adkisson](https://github.com/jayferd)
[Fernando Blat](https://github.com/ferblape)
