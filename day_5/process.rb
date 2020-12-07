require_relative 'boarding_pass'
require_relative 'plane'

passes = File.readlines('input', chomp: true).map { |l| BoardingPass.new(l) }
plane = Plane.new

ids = passes.map { |pass| plane.seat_for(pass) }.sort
puts ids.last

ids.each_cons(3) do |(first, middle, last)|
  if first + 1 != middle
    puts first + 1
    return
  end
end
