require 'redis'

module Vandelay
  module Util
    class Cache
      def initialize
        @redis = Redis.new
      end

      def fetch(key)
        @redis.get(key)
      end

      def store(key, value, ttl = nil)
        if ttl
          @redis.set(key, value, ex: ttl)
        else
          @redis.set(key, value)
        end
      end
    end
  end
end
