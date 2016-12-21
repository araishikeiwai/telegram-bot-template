class Object.const_get($namespace_class)::SpamUtil

  def self.add?(id, group)
    key = "#{$namespace}_spam_#{id}"
    $redis.incr(key)
    ttl = group ? 10 : 30
    $redis.expire(key, ttl) if $redis.ttl(key) < 0
    $redis.get(key).to_i <= 10
  end
end
