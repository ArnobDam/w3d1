# frozen_string_literal: true

class Array
  # hey do you see this?

  def my_each(&block)

    i = 0
    while i < self.size
      block.call(self[i])
      i += 1
    end

    self

  end

  def my_select(&block)

    result = []

    self.my_each do |ele|
      if block.call(ele)
        result.push(ele)
      end
    end
    result
  end
end
