# Name: TAN WEI JIE AMOS
# Section: G1

# project 1 Q2

# Takes in 4 arguments:
#   - carbs (array of integers)
#   - protein (array of integers)
#   - fat (array of integers)
#   - diet_plans (array of strings): each string represents the diet plan of one customer
# You can assume that the length of carbs, protein and fat will always be the same, and corresponds to the number of menu items that customers can choose from.
# Returns:
#   - an array of indices (integers) of menu items for each customer
#   - the length of the returned integer array MUST be the same as the length of diet_plans.
# require 'csv'

def select_meals(carbs, protein, fat, diet_plans)
    # for now, this method returns an array of zeros of the correct length
    results = []

    #hash to store nutritional values for each menu item
    carbs_hash = {}
    protein_hash = {}
    fat_hash = {}
    calorie_hash = {}

    #arrays to store highest/lowest meals of that particular nutrition.
    high_carb_meals = []
    low_carb_meals = []
    high_protein_meals = []
    low_protein_meals = []
    high_fat_meals = []
    low_fat_meals = []
    high_calorie_meals = []
    low_calorie_meals = []

    max_carb = 0
    max_protein = 0
    max_fat = 0
    max_calorie = 0
    min_carb = 0
    min_protein = 0
    min_fat = 0
    min_calorie = 0

    history_hash = {}

    for i in 0...carbs.length
        # item = []
        carb_value = carbs[i]
        protein_value = protein[i]
        fat_value = fat[i]

        carbs_hash[i] = carb_value
        protein_hash[i] = protein_value
        fat_hash[i] = fat_value
        calorie_value = 5 * (carb_value + protein_value) + 9 * fat_value
        calorie_hash[i] = calorie_value

        #if there are not menu items in the highest/lowest arrays
        #arbitrarily store the first item inside all the arrays
        if i == 0
            high_carb_meals << 0
            low_carb_meals << 0
            high_protein_meals << 0
            low_protein_meals << 0
            high_fat_meals << 0
            low_fat_meals << 0
            high_calorie_meals << 0
            low_calorie_meals << 0

            max_carb = carb_value
            max_protein = protein_value
            max_fat = fat_value
            max_calorie = calorie_value

            min_carb = carb_value
            min_protein = protein_value
            min_fat = fat_value
            min_calorie = calorie_value
        else
            if carb_value > max_carb
                high_carb_meals = [i]
                max_carb = carb_value
            elsif carb_value == max_carb
                high_carb_meals << i
            elsif carb_value < min_carb
                low_carb_meals = [i]
                min_carb = carb_value
            elsif carb_value == min_carb
                low_carb_meals << i
            end

            if protein_value > max_protein
                high_protein_meals = [i]
                max_protein = protein_value
            elsif protein_value == max_protein
                high_protein_meals << i
            elsif protein_value < min_protein
                low_protein_meals = [i]
                min_protein = protein_value
            elsif protein_value == min_protein
                low_protein_meals << i
            end

            if fat_value > max_fat
                high_fat_meals = [i]
                max_fat = fat_value
            elsif fat_value == max_fat
                high_fat_meals << i
            elsif fat_value < min_fat
                low_fat_meals = [i]
                min_fat = fat_value
            elsif fat_value == min_fat
                low_fat_meals << i
            end

            if calorie_value > max_calorie
                high_calorie_meals = [i]
                max_calorie = calorie_value
            elsif calorie_value == max_calorie
                high_calorie_meals << i
            elsif calorie_value < min_calorie
                low_calorie_meals = [i]
                min_calorie = calorie_value
            elsif calorie_value == min_calorie
                low_calorie_meals << i
            end
        end
    end


    # p "High Carbs " + high_carb_meals.inspect
    # p "High Protein " + high_protein_meals.inspect
    # p "High Fat " + high_fat_meals.inspect
    # p "High Calorie " + high_calorie_meals.inspect
    # p "Low Carbs " + low_carb_meals.inspect
    # p "Low Protein " + low_protein_meals.inspect
    # p "Low Fat " + low_fat_meals.inspect
    # p "Low Calorie " + low_calorie_meals.inspect

    #assign arrays to history_hash
    history_hash["C"] = high_carb_meals
    history_hash["P"] = high_protein_meals
    history_hash["F"] = high_fat_meals
    history_hash["T"] = high_calorie_meals
    history_hash["c"] = low_carb_meals
    history_hash["p"] = low_protein_meals
    history_hash["f"] = low_fat_meals
    history_hash["t"] = low_calorie_meals

    diet_plans_hash = {}
    for i in 0...diet_plans.length
        diet = diet_plans[i]
        if diet_plans_hash.has_key?(diet)
            diet_plans_hash[diet] << i
        else
            diet_plans_hash[diet] = [i]
        end
    end

    diet_plans = diet_plans_hash.keys
    result = nil
    for i in 0...diet_plans.length

        #get diet plan string
        diet_plan = diet_plans[i]
        # p "diet plans : #{diet_plan}"
        if !diet_plan.empty?
            #change diet plan string into an array of string
            diet_plan_array = diet_plan.chars.to_a
            #remove the first index of the diet plan array
            key_str = diet_plan_array.shift
            #retrieve previously stored array
            history = history_hash[key_str]
            #loop through diet_plan_array while history does not return nil
            temp_history_array = []

            while diet_plan_array.length > 0
                #retrieve first character from diet_plan_array
                temp_char = diet_plan_array[0]

                #concatenate character with key_str to form new key_str
                # key_str += temp_char
                # p key_str
                #get history with new key_str
                temp_history_array = history_hash[key_str+temp_char]

                #if temp_history_array != nil and less than current history.length
                if temp_history_array.nil?
                    # p "BREAK!"
                    break
                else #if temp_history_array.length <= history.length
                    history = temp_history_array
                    key_str+= temp_char
                    diet_plan_array.shift
                end
            end

            # p "Retrieved History: " + history.to_s
            # p "Current key_str: #{key_str}"
            if history.length > 1

                for j in diet_plan_array
                    temp_char = j
                    if temp_char == "C"
                        highest_carb_value = -1
                        temp_highcarb_array = []
                        for item in history
                            carbohydrates = carbs_hash[item]
                            if carbohydrates > highest_carb_value
                                highest_carb_value = carbohydrates
                                temp_highcarb_array = [item]
                            elsif carbohydrates == highest_carb_value
                                temp_highcarb_array << item
                            end
                        end
                        history = temp_highcarb_array
                    elsif temp_char == "P"
                        highest_protein_value = -1
                        temp_highpro_array = []
                        for item in history
                            protein = protein_hash[item]
                            if protein > highest_protein_value
                                highest_protein_value = protein
                                temp_highpro_array = [item]
                            elsif protein == highest_protein_value
                                temp_highpro_array << item
                            end
                        end
                        history = temp_highpro_array
                    elsif temp_char == "F"
                        highest_fat_value = -1
                        temp_highfat_array = []
                        for item in history
                            fat = fat_hash[item]
                            if fat > highest_fat_value
                                highest_fat_value = fat
                                temp_highfat_array = [item]
                            elsif fat == highest_fat_value
                                temp_highfat_array << item
                            end
                        end
                        history = temp_highfat_array
                    elsif temp_char == "T"
                        highest_calorie_value = -1
                        temp_highcal_array =[]
                        for item in history
                            calorie = calorie_hash[item]
                            if calorie > highest_calorie_value
                                highest_calorie_value = calorie
                                temp_highcal_array = [item]
                            elsif calorie == highest_calorie_value
                                temp_highcal_array << item
                            end
                        end
                        history = temp_highcal_array
                    elsif temp_char == "c"
                        lowest_carb_value = 101
                        temp_lowcarb_array = []
                        for item in history
                            carbohydrates = carbs_hash[item]
                            if carbohydrates < lowest_carb_value
                                lowest_carb_value = carbohydrates
                                temp_lowcarb_array = [item]
                            elsif carbohydrates == lowest_carb_value
                                temp_lowcarb_array << item
                            end
                        end
                        history = temp_lowcarb_array
                        # p "History: " + history.to_s
                    elsif temp_char == "p"
                        lowest_protein_value = 101
                        temp_lowpro_array = []
                        for item in history
                            protein = protein_hash[item]
                            if protein < lowest_protein_value
                                lowest_protein_value = protein
                                temp_lowpro_array = [item]
                            elsif protein == lowest_protein_value
                                temp_lowpro_array << item
                            end
                        end
                        history = temp_lowpro_array
                    elsif temp_char == "f"
                        lowest_fat_value = 101
                        temp_lowfat_array = []
                        for item in history
                            fat = fat_hash[item]
                            if fat < lowest_fat_value
                                lowest_fat_value = fat
                                temp_lowfat_array = [item]
                            elsif fat == lowest_fat_value
                                temp_lowfat_array << item
                            end
                        end
                        history = temp_lowfat_array
                    elsif temp_char == "t"
                        lowest_calorie_value = 1901
                        temp_lowcal_array = []
                        for item in history
                            calorie = calorie_hash[item]
                            if calorie < lowest_calorie_value
                                lowest_calorie_value = calorie
                                temp_lowcal_array = [item]
                            elsif calorie == lowest_calorie_value
                                temp_lowcal_array << item
                            end
                        end
                        history = temp_lowcal_array
                    end
                    #concatenate new string
                    key_str += temp_char
                    if !history_hash.has_key?(key_str)
                        # p "History: " + history.to_s

                        history_hash[key_str] = history
                    end
                    # p "Ff : " + history_hash["Ff"].to_s
                end

                if history.length > 1
                    result = history.min
                else
                    # p "CHECK HERE " + history[0].to_s
                    result = history[0]
                end
                # p "results : " + results.to_s
            else
                result = history[0]
            end
        else
            result = 0
        end

        meals = diet_plans_hash[diet_plan]
        meals.each{|index|results[index] = result }
    end


    # CSV.open("results.csv", "w") do |csv|
    #     results.each { |x| csv << [x] }
    # end

    return results
end
