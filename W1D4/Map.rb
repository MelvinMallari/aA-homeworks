class Map
  attr_accessor  :ivar

  def initialize
    @ivar = Array.new 
  end

  def set(key, val)
    previous_index = ivar.index { |pair| pair[0] == key }
    previous_index ? self.ivar[previous_index][1] = key : self.ivar << [key, val] 
    val
  end

  def get(key)
    self.ivar.each { |pair| return pair[1] if pair[0] == key}
    nil
  end

  def delete(key)
    res = self.ivar.get(key)
    self.ivar.reject! { |pair| pair[0] == key}
    res
  end

  def show
    deep_dup(self.ivar)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) deep_dup(el) : el }
  end
end