3.times {print "hello world!\n"}

def are_you_sure?
   while true
      print "Are you sure? [y/n]: "
      response = gets
      case response
      when /^[yY]/
	 return true
      when /^[nN]/, /^$/
	 return false
      end
   end
end

result = are_you_sure?
if result
   puts "you are sure!"
elsif !result
   puts "you are not sure!"
end

class Sequence
   include Enumerable

   def initialize (from, to, by)
      @from, @to, @by = from, to, by
   end

   def each
      x = @from	#start at the starting point
      while x <= @to	#while we haven't reached the end
	 yield x	#pass x to the block associated with iterator
	 x += @by
      end
   end

   def length
      return 0 if @from > @to
      Integer((@to-@from)/@by) + 1
   end

   alias size length

   def[](index)
      return nil if index < 0 #return nil for negative indexes
      v = @from + index*@by   #compute the value
      if v <= @to
	 v
      else
	 nil
      end
   end

   def *(factor)
      Sequence.new(@from*factor, @to*factor, @by*factor)
   end

   def +(offset)
      Sequence.new(@from+offset, @to+offset, @by)
   end
end

s = Sequence.new(1, 10, 2)    #from 1 to 10 by 2's
s.each {|x| print x}
puts "\n"
puts "#{s[s.size-1]}\n"	      #print last value
t = (s+1)*2
t.each {|x| print x}
puts "\n"
puts "#{t[t.size-1]}\n"

