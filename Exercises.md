# 1. Task list

We want to make an application where every user can create a task list, being able to add tasks and mark them as complete.

The users will register with their email and a password. We will want to store their full name as well.

For each task we want to store the following information:
- Title
- Description
- State (done or in progress)
- Due date

# 2. Taxis

We want to store the information about taxi drivers of our province and their cars.

For every driver we want to know its name and phone number. And for every car we want to know the brand, model and plate number. Additionally,
we need to store images of the cars to follow up on the conditions of the cars in case they have an accident.

In the province there are several garages where the cars will be parked at the end of the day. Each garage has an address and the number
of cars that can be parked there.

Each car can only be drive by one driver at the same time, and the application will allow us to define the period of time that the driver
will be driving the car.

# 3. Chat Rooms

We want to develop an application where users can create chat rooms and assign different roles to each member of the room. 

Users will register with email and password, and we will also store their full name, and they will have a unique username. Each room has an 
owner (the user who initially created it), a name, and a description. The room can be configured as private, so only those with an 
invitation can join. The invitation should be an automatically generated link. If the room is public, no invitation is needed to join.

Room owners can create roles and assign them to other users. For each role, we want to store the name and a description.

Finally, we want to store the date, including hour and minute, of each message sent in each room, as well as the user who sent it.

# 4. Insurance Company

Our company needs to store data about its clients and the insurance policies they have acquired. For each client, we want to know their 
identity document number and full name.

The insurance policies can cover repair expenses in case of damages to properties (houses, apartments, etc.) or vehicles. In the case of 
properties, we are interested in storing the total square meters of the property as well as its address, while for vehicles we want to 
store their purchase price and license plate number. This information will be used to calculate the annual cost of the insurance that the 
client will need to pay.

The client will be able to choose the percentage of the total repair expenses that the insurance will cover when contracting it, for 
example, 40%. This data will also be necessary to calculate the annual price.

# 5. Departments and Employees

Our company has several offices located in different buildings, and each of them contains various departments. The buildings have an 
associated number, which is unique among buildings in the same city but can be repeated for buildings in different cities.

For the departments, we want to store their name, which is unique, their department number, which is also unique, and their annual budget. 
Additionally, we want to know in which department each employee works, for which we have their employee number, which is unique within each 
department but can be repeated for employees in different departments. Finally, employees can be in charge of other employees, and we want 
to store this information.
