class LRUCache
  attr_reader :cache, :max_cache_length
  def initialize(cache_length)
    @cache = []
    @max_cache_length = cache_length
  end

  def count
    # returns number of elements currently in cache
    cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    cache.delete(el) if cache.include?(el)
    if cache.length > max_cache_length
      cache.shift
      cache << el
    else
      cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    print cache
  end

  private
  # helper methods go here!

end