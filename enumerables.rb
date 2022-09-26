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
end
