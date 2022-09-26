# frozen_string_literal: true

class Array
  def my_each(&block)
    i = 0
    while i < size
      block.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&block)
    result = []
    my_each { |ele| result.push(ele) if block.call(ele) }
    result
  end

  def my_reject(&block)
    result = []
    my_each { |ele| result.push(ele) unless block.call(ele) }
    result
  end

  def my_any?(&block)
    my_each { |el| return true if block.call(el) }
    false
  end

  def my_all?(&block)
    my_each { |el| return false unless block.call(el) }
    true
  end


  def my_flatten

    return [self] unless self.is_a?(Array)

    self.inject([]) do |result, ele|
      ele.is_a?(Array) ? result + ele.my_flatten : result + [ele]
    end

  end

  def my_zip(*args)

    result = Array.new(self.length) { Array.new }

    self.each_with_index do |ele,i|
      result[i] << ele
    end

    (0...self.length).each do |i|
      args.each do |arg|
        if arg[i] == nil
          result[i] << nil
        else
          result[i] << arg[i]
        end
      end
    end

    result
  end

end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]