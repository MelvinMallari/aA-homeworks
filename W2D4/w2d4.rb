fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']



def bubble_sort(fishes)
  res = fishes.dup
  sorted = false

  until sorted
    sorted = true
    res.each_with_index do |el, i|
      next if i == res.length - 1
      j = i + 1
      if res[i].length > res[j].length
        sorted = false
        res[i], res[j] = res[j], res[i]
      end
    end
  end
  res
end

def quick_sort(fishes)
  return fishes if fishes.length <= 1
  pivot = fishes.first.length
  left_array = fishes[1..-1].select { |fish| fish.length <= pivot }
  right_array = fishes[1..-1].select { |fish| fish.length > pivot }
  res = quick_sort(left) + [pivot] + quick_sort(right)
  re
end

def linear_search(fishes)
  max_length = 0
  res = nil
  fishes.each do |fish|
    if fishes.length > max_length
      res = fish
      max_length = fish.length
    end
  end
  res
end


def sluggish_octopus(fishes)
  res = bubble_sort(fishes)
  res.last
end

def dominant_octopus(fishes)
  res = quick_sort(fishes)
  res.last
end

def clever_octopus(fishes)
  res = linear_search(fishes)
  res.last
end

def slow_dance(move, tiles_array)
  tiles_array.each_with_index { |el, i| return i if el == move}
end

def fast_dance(move, tiles_hash)
  tiles_hash.each { |key, val| return val if key == move }
end
