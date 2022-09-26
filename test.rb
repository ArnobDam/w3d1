class Array
  def my_zip(*args)
    result = Array.new(self.length) { Array.new(args.length + 1) }
    
    result
  end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
