#SMUA APP#
This is the web application I did with my friends over 7 weeks for the IS203 Software Engineering Module.

##Some Of Technologies/Libraries Used##
- Maven
- Spring MVC
- Hibernate
- D3.js
- GSON

##Description##
Project scenarios: Various SMU organizations would like to understand online and physical behaviour of SMU students to better support students’ life at SMU campus; for example, IITS would like to understand what types of apps students use and where they use those apps for proper bandwidth allocation of Campus WiFi or installations of new access points. Moreover, building managers may need to find out where the students are located and how they move around on campus for better utilization of limited spaces. Besides SMU organizations, individual students may want to quantify and trace their own smartphone usage to understand if they are overusing smartphones and reduce the phone use time if necessary.

It is well known that SIS students are good at designing and building web applications, so the university requested your team to build an SMU Analytics application (we call it SMUA, hereinafter). SMUA is a web application that can be used by any valid users to obtain useful statistics on the smartphone app usage and locations of SMU students. Users are allowed to select the type of analytics services (e.g., the most popular smartphone app used by SIS students, highly utilized spaces in SIS building, etc.), and SMUA will show the corresponding information in return in a user-friendly manner.

##Functions##
__Functionality/Requirements Overview__

1. Login
	- A user is able to log in with their email ID and password.
	- All the reports are only accessible after logging in.

2. Bootstrap
	- The administrator can bootstrap the SMUA system with app usage and demographics data.
	- The administrator can add additional data.

3. Basic App Usage Report
	- A user can see the following app usage stats for any given duration:
	- Breakdown by usage time category (e.g., High/Medium/Low)
	- Breakdown by usage time category and demographics
	- Breakdown by app category
	- Diurnal pattern of app usage time

4. Top-k App Usage Report (Blue)
	- A user can see the top-k users/apps for any given duration:
	- Top-k most used apps (given a school)
	- Top-k students with most app usage (given an app category)
	- Top-k schools with most app usage (given an app category)

5. Smartphone Overuse Report
	- A user can see a smartphone overuse index (based on smartphone usage time, gaming time, and frequency of checking smartphones) for themselves for self-feedback and potential behaviour changes.

6. Dual Interfaces (Web UI and Web Services)
	- Web UI: Provide a user-friendly web UI for all features that your team needs to implement. The basic UI requirement is showing results in nicely formatted tables, text, etc.
	- Web Services: Provide JSON APIs that allow all functionalities to be queried programmatically by other machines.

7. Loading Location Data
	- The administrator can bootstrap the SMUA system with location data of students.
	- The administrator can add new location data.

8. Deletion of Data
	- While loading location data for bootstrapping, the app may be required to delete a subset of data which could cause undesirable bias to the analysis.
	- Also, the administrator is able to delete a subset of data (for a certain user over a certain period), using a web UI.
	- All the subsequent queries after the deletion must return the results without including the deleted data.

9. Smartphone Usage Heatmap
	- A user can see the density of people using smartphones for a specified floor in the SIS building, given a particular date and time. (Output does not need to be in graphical form.)

10. Social Activeness Report
	- A user can calculate their own social activeness (based on social communication app usage and physical grouping).

11. Advanced Smartphone Overuse Report
	- A user can see an improved overuse index that considers inappropriate use of smartphones under certain contexts: usage in seminar rooms and while in small groups.
12. Graphical UIs (Heatmap and Chart)
	- The heatmap is graphically shown on SIS floor maps.
	- The basic app usage reports and top-k app usage reports are graphically presented using charts.

13. Use of framework
	- Your team is required to use a web framework (e.g., Struts, Stripes, Hibernate, Play) for the app development.
	- All the team members will need to understand how to use the framework.
	- Among various features of frameworks, you are required to use the MVC template provided by the framework along with the persistence layer. Use of other features is optional.

14. Fast execution of queries (Black)
	- Bootstrap of the given location data need to be finished in a designated time.
	- All queries need to be finished in a designated time.

- - - -