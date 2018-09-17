# 5
# 3 2    2 3
# -----
# -----
# p--m-
# -----
# -----


def nextMove(n,c,r,p,grid)
  case
  when p[0] - r < 0 then move = "UP"
  when p[0] - r > 0 then move = "DOWN"
  when p[1] - c < 0 then move = "LEFT"
  when p[1] - c > 0 then move = "RIGHT"
  end
  move
end

if defined? _input
  lines = _input.strip.split("\n")
  n = lines[0].to_i
  x,y = lines[1].strip.split.map {|n| n.to_i}
  grid = lines[2..-1]
  princess = nil
  grid.each_with_index do |r, i|
    if r.include? 'p'
      princess = [i, r.strip.index('p')]
      break
    end
  end
else
  # Tail starts here
  n = gets.to_i

  x,y = gets.strip.split.map {|num| num.to_i}

  grid = Array.new(n)

  princess = nil
  (0...n).each do |i|
    row = gets
    if row.include? 'p'
      princess = [i, row.index('p')]
    end
    grid[i] = row
  end
end

puts nextMove(n,x,y,princess,grid)
