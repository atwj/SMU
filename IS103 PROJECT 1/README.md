#IS103 Project 1#
These are my submissions for the the first project of my algorithms class.

## Question 1 - Elevator Problem ##
The elevators in SIS are out of order sometimes. One possible reason is that the load of the elevator exceeds the limit. To reduce the load and increase the efficiency, we propose a new scheme: when the elevator goes up, the elevator does not stop at every floor but only stops once at one chosen floor.  The users are not going to this floor need to use the stairs. For example, if the elevator stops at floor 4, those going to floor 3 need to go down one floor using the stairs and those going to the floor 5 need to climb up one floor using the stairs. 

So when the elevator is at the basement floor, each user let you know which floor they are going. You need to implement a ruby program to decide which floor the elevator should stop so the total number of floors the users need to use stairs is minimized.
 
The program should take two inputs:
-	Number of floors: n
-	Each user’s floor choice: [u1, u2, u3, u3, … um] 

Output: which floor the elevator should stop.

If we take into consideration that climbing up using stairs is harder than going down using stairs, we can then assign different weights to them.  We assume that walking down one floor using stairs consumes the user 1 unit of energy while climbing up one floor consumes the user 2 units of energy.  Can you modify the code accordingly to determine the floor the elevator needs to stop so the total amount of energy is minimized? 

###TODO###

1. Write a get_floor method that returns the floor that your elevator should stop at to minimize the energy required. get_floor takes in two arguments:
	- n (an integer showing the number of floors/highest floor of the building)
	- target_floors (an array of integers – the floors that each user wants to go to)
	- You can assume that all values in target_floors will be <=n, so n is the “upper bound” for all the integers in target_floors. Your algorithm may or may not make use of n.

2. Write a **get_floor** method that returns the floor that your elevator should stop at to minimize the energy required. get_floor takes in two arguments:
	- n (an integer showing the number of floors/highest floor of the building)
	- target_floors (an array of integers – the floors that each user wants to go to)
	- You can assume that all values in target_floors will be <=n, so n is the “upper bound” for all the integers in target_floors. Your algorithm may or may not make use of n.

	
- - - - 
## Question 2 - Diet Selection Problem ##

The eatery that everyone goes to has started publishing nutritional contents for all its menu items. Each customer will always buy only 1 menu item, and since everyone is obsessed with healthy eating, it is important to make sure that each customer orders the menu item that follows his diet plan. 

A diet plan is represented by a string consisting of the following characters:

<table>
	<th>Character in diet plan</th><th>Meaning</th>
	<tr><td>C</td><td>High Carbs</td></tr>
	<tr><td>c</td><td>Low Carbs</td></tr>
	<tr><td>P</td><td>High Protein</td></tr>
	<tr><td>p</td><td>Low Protein</td></tr>
	<tr><td>F</td><td>High Fat</td></tr>
	<tr><td>f</td><td>Low Fat</td></tr>
	<tr><td>T</td><td>High Calorie</td></tr>
	<tr><td>t</td><td>Low Calorie</td></tr>
</table>

The position of these characters in the string is significant because the position represents the order of importance. Whenever more than one meal item is tied according to the diet plan, then the one with a lower (smaller) index should be selected. The following table shows a few examples of how to interpret the diet plan string: 

<table>
	<th>Diet plan</th><th>Meaning</th>
	<tr><td>"tf"</td><td>Doctor recommends a meal with the lowest possible calories, and if more than one meal item is tied for lowest calories, the meal item with less fat should be selected.</td></tr>
	<tr><td>"ft"</td><td>Doctor recommends a meal with the lowest possible fat, and if more than one meal item is tied for lowest fat, the meal item with lesser calories should be selected.</td></tr>
	<tr><td>"Ftc"</td><td>Doctor recommends a meal with the highest possible fat, and if more than one meal item is tied for highest fat, the meal item has the same fat and calorie content, the meal item with lesser carbs should be selected.</td></tr>
</table>

Calories are found in carbs, protein and fat. The total calorie amount is not specified for menu items but can be simply computed using the following table: 

<table>
	<th>Description</th><th>Calorie Content</th>
	<tr><td>1 gram of carbs</td><td>5 units</td></tr>
	<tr><td>1 gram of protein</td><td>5 units</td></tr>
	<tr><td>1 gram of fat</td><td>9 units</td></tr>
</table>

Given the amount of carbs, protein and fat for each menu item, and each customer’s diet plan, you are supposed to determine the menu item that each customer should order.

###TODO:###
1. Write a **select_meals** method that takes in four arugments:
	- **carbs** (an array of integers representing the amount of carbs in each menu item)
	- **protein** (an array of integers representing the amount of protein in each menu item)
	- **fat** (an array of integers representing the diet plans of each customer)
	- **diet_plans** (an array of strings representing the diet plans of each customer)

	- This method returns an array of integers that represent the menu items that each customer should order. 

	- Elements from the **carbs**, **protein** and **fat** arrays correspond to the elements of the other arrays with the same index; in other words, item i’s nutritional contents are stored in **protein[i]**, **carbs[i]**, and **fat[i]**. Dietary plans for each customers is given as a string array, **diet_plans**. Each element of **diet_plans** describes the diet plan for a customer. 

	- Some examples in Ruby:
		- carbs   = [2, 3, 10]	# <-- carbs in 3 menu items
		- protein = [4, 3, 1]   	# <-- protein in 3 menu items
		- fat     = [4, 3, 1]   	# <-- fat in 3 menu items


2. The returned integer array should have the same number of elements as diet_plans, and each value of the returned array should correspond to the element of diet_plans with the same index.

3. When no diet plan is specified for a customer (i.e. the diet plan is an empty string ""), the selected menu item for him should be the menu item with the lowest index (0).

4. Your select_meals method is expected to work within these boundaries:
	-	Each of the arrays: **carbs**, **protein** and **fat** will each contain at least 1 integer each (i.e. there will be at least one menu item). Each of these integers will be between 0 and 100 (inclusive).
	- **diet_plans** will contain at least 1 string (i.e. there will be at least customer with a diet plan). Each string will be between 0 and 4 characters in length (inclusive), and will contain only the following characters: CcPpFfTt.





