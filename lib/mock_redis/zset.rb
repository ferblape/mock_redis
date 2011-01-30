class MockRedis
  require 'set'

  module ZSetMethods
    def zadd(key, score, value)
      fail_unless_set(key)
      value = value.to_s
      case set = self.hash[key]
        when nil
          self.hash[key] = Set.new([value])
        when Set
          set.add value
      end
      case scores_hash = self.scores[key]
        when nil
          self.scores[key] = {}
          self.scores[key][value] = score
        when Hash
          scores_hash[value] = score
        end
      return 1
    end

    def zcard(key)
      fail_unless_set(key)
      case set = self.hash[key]
        when nil ; 0
        when Set ; set.size
      end
    end

    def zrem(key, value)
      value = value.to_s
      fail_unless_set(key)
      case set = self.hash[key]
        when nil
          return
        when Set
          set.delete(value)
          self.scores[key].delete(value)
      end
      return 1
    end

    def zscore(key, value)
      fail_unless_set(key)
      case scores_hash = self.scores[key]
        when nil
          return nil
        when Hash
          scores_hash[value]
        end
    end

    def zrange(key, range_start, range_end)
      fail_unless_set(key)
      case scores_hash = self.scores[key]
        when nil
          return nil
        when Hash
          scores_hash.sort{ |a,b| a[1] <=> b[1] }.map{ |e| e.first }[range_start..range_end]
        end
    end

    private

    def is_a_set?(key)
      self.hash[key].is_a?(Set) || self.hash[key].nil?
    end

    def fail_unless_set(key)
      unless is_a_set?(key)
        fail "Not a set"
        return 0
      end
    end
  end

  include ZSetMethods
end
