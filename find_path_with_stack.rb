#!/usr/bin/env ruby

require 'optparse'
require 'set'
require 'pp'

maze = [ 
        ["x", "x", "x", "x", "x", ],
        ["x", " ", " ", " ", " ", ],
        ["x", " ", "x", "x", "x", ],
        ["x", " ", "x", "x", "x", ],
        ["x", " ", "x", " ", "x", ],
        ["x", "x", "x", "x", "x", ],
       ] 

point_a = [ 4, 1  ]
point_b = [ 1, 3  ]
point_c = [ 4, 3  ]
# 
#maze[point_a[0]][point_a[1]] = "A"
#maze[point_b[0]][point_b[1]] = "B"
#maze[point_c[0]][point_c[1]] = "C"

pp(maze)

#create our stack
stack = []
stack.push(point_a)
# a second way
#stack = [ point_a ]

# This is called a "flood fill"
while stack.size > 0 
  # curent point == p
  # # we pop the last thing off the array.. you know with pop
  p = stack.pop

  # if p is blank mark it
  if maze[p[0]][p[1]] == " "
    # Mark position A with Marker
    maze[p[0]][p[1]] = "M"

    # pushing P's neighbors onto the stack
    # Push all neighbors onthe the stack
    stack.push([p[0]+1,p[1]])
    stack.push([p[0]-1,p[1]])
    stack.push([p[0],p[1]+1])
    stack.push([p[0],p[1]-1])
  end
  # MIND BLOWN!!!
end 
#
pp(p)
pp(stack)
pp(maze)

#puts maze.kind_of?(Array)
#unit test for this: 
#  point a can get to b and point a can not get to c
