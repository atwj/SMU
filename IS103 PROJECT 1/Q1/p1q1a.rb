# Name: TAN WEI JIE AMOS
# Section: G1
 
# project 1 Q1(a)

# you can assume that n is <= every single integer in floors
# returns the floor that the elevator should stop
# takes in 2 arguments:
#   - n (integer): number of floors of this building
#   - target_floors (array of integers): the various target floors that each person wants to go

def get_floor(n, target_floors)
  #Because the max floor is n, we can ignore the integers that are greater than n
  #Assumption 1: The scenario that will give the best output is the one that will have everyone in the lift
  #climbing the least floors. THEREFORE: We will select the floor with the most common number.
  work_array = target_floors.uniq

  e = -1
  floor = 0
  for x in work_array
    if e == -1
      e = get_energy_required(x, target_floors, 1, 1)
      floor = x
    else
      new_e = get_energy_required(x, target_floors, 1, 1)
      if new_e < e
        e = new_e
        floor = x
      end
    end

  end

  return floor
end

