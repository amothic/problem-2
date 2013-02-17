#! /usr/bin/env ruby
def get_alphabet(n)
  ('A'..'Z').to_a[n-1] || n.to_s
end

def printout(i, times, next_f)
  if (i == times) then
    $buff += "|\n"
    return 
  end

  if (next_f == true) then
    $buff += "|   "
    printout(i+1, times, false)
    return
  end

  if (rand(2) == 0) then
    $buff += "|---"
    $connect = $connect | (1 << i)
    printout(i+1, times, true)
    return
  else
    $buff += "|   "
    printout(i+1, times, false)
    return
  end

end

arg = ARGV[0].to_i

$connect = 0
$buff = ""

for i in 1.step(arg) do
  print(get_alphabet(i) + "   ")
end
print("\n")


until ($connect >= ((2**(arg-1))-1)) do
  for i in 0..ARGV[1].to_i do
    printout(0, arg-1, false)
  end
  if ($connect >= ((2**(arg-1))-1)) then
    puts $buff
  else
    $connect =0
    $buff = ""
  end
end


a = rand(arg)
a.times do
  print("    ")
end 
print("*\n")
