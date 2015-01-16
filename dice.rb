#!/usr/bin/env ruby
require 'pp'

# Given dice with a particular sides
# given a particular number of dice
# what is the probability that rolling that many dice 
# adds up to a number greater then some target
# also.. why can't I spell???
#
black_die = [ 0, 3, 3, 3, 5, 6 ]

# what are the odds if  I roll 3 of them for the sum to be more then or == 11

win = 0
notwin = 0

# pain in the ass nested for loops
for i in 0...black_die.length
  for j in 0...black_die.length
    for k in 0...black_die.length
      if black_die[i]+black_die[j]+black_die[k] >= 11
        win = win+1
      else 
        notwin = notwin+1
      end
    end
  end
end
puts (100.0*win/(notwin+win)).round(2)

# more flexable (and sexy) recursion (vavavoom)
def win_percent( dicenumber, number2beat, facesofdie )
  @win = 0
  @notwin = 0
  @num2beat = number2beat
  @faces = facesofdie
  def recurse ( diceleft, sumsofar ) 
    if diceleft == 0
      if sumsofar >= @num2beat
        @win = @win+1
      else
        @notwin = @notwin+1
      end
    else
      for i in 0...@faces.length
        recurse( diceleft-1, sumsofar+@faces[i] )
      end
    end
  end
  recurse( dicenumber, 0 )
  percent = (100.0*@win/(@notwin+@win)).round(2)
  puts "#{percent}%"
end

win_percent(6, 11, black_die)
