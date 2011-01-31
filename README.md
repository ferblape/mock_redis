# Mock Redis

A little class that acts like redis-rb, but for testing on machines without redis.

Based on [https://github.com/jayferd/mock_redis](https://github.com/jayferd/mock_redis) but with improvements such as the Zset type (with some specs) and _gemification_.

## Usage

    redis = MockRedis.new

now pretend `redis` is a redis client.

See [http://github.com/ezmobius/redis-rb](http://github.com/ezmobius/redis-rb) for more details about the client and [Redis command list](http://redis.io/commands).

## Disclaimer

This mock is still in development. I haven't tested it with any project, so use it carefully.

Patches and improvements are accepted :)

## Authors

  * [Jay Adkisson](https://github.com/jayferd), author of the original version
  * [Fernando Blat](https://github.com/ferblape)
