# Name: TAN WEI JIE AMOS
# Section: G1
 
# project 1 Q1(b)

# you can assume that n is <= every single integer in floors
# returns the floor that the elevator should stop
# takes in 2 arguments:
#   - n (integer): number of floors of this building
#   - target_floors (array of integers): the various target floors that each person wants to go

def get_floor(n, target_floors)
  work_array = target_floors.uniq

  e = -1
  floor = 0
  for x in work_array
    new_e = 0
    if e == -1
      e = get_energy_required(x, target_floors, 2, 1)
      floor = x
    else
      new_e = get_energy_required(x, target_floors, 2, 1)
      if new_e < e
        e = new_e
        floor = x
      end
    end

  end

  return floor
end
