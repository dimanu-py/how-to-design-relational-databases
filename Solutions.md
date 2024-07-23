# 1. Task list

We want to make an application where every user can create a task list, being able to add tasks and mark them as complete.

The users will register with their email and a password. We will want to store their full name as well.

For each task we want to store the following information:
- Title
- Description
- State (done or in progress)
- Due date

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/1_task_lists.png">

</details>

# 2. Taxis

We want to store the information about taxi drivers of our province and their cars.

For every driver we want to know its name and phone number. And for every car we want to know the brand, model and plate number. Additionally,
we need to store images of the cars to follow up on the conditions of the cars in case they have an accident.

In the province there are several garages where the cars will be parked at the end of the day. Each garage has an address and the number
of cars that can be parked there.

Each car can only be drive by one driver at the same time, and the application will allow us to define the period of time that the driver
will be driving the car.

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/2_taxis.png">

</details>

# 3. Chat Rooms

We want to develop an application where users can create chat rooms and assign different roles to each member of the room. 

Users will register with email and password, and we will also store their full name, and they will have a unique username. Each room has an 
owner (the user who initially created it), a name, and a description. The room can be configured as private, so only those with an 
invitation can join. The invitation should be an automatically generated link. If the room is public, no invitation is needed to join.

Room owners can create roles and assign them to other users. For each role, we want to store the name and a description.

Finally, we want to store the date, including hour and minute, of each message sent in each room, as well as the user who sent it.

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/3_chat_rooms.png">

</details>

# 4. Insurance Company

Our company needs to store data about its clients and the insurance policies they have acquired. For each client, we want to know their 
identity document number and full name.

The insurance policies can cover repair expenses in case of damages to properties (houses, apartments, etc.) or vehicles. In the case of 
properties, we are interested in storing the total square meters of the property as well as its address, while for vehicles we want to 
store their purchase price and license plate number. This information will be used to calculate the annual cost of the insurance that the 
client will need to pay.

The client will be able to choose the percentage of the total repair expenses that the insurance will cover when contracting it, for 
example, 40%. This data will also be necessary to calculate the annual price.

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/4_insurance_company.png">

</details>

# 5. Departments and Employees

Our company has several offices located in different buildings, and each of them contains various departments. The buildings have an 
associated number, which is unique among buildings in the same city but can be repeated for buildings in different cities.

For the departments, we want to store their name, which is unique, their department number, which is also unique, and their annual budget. 
Additionally, we want to know in which department each employee works, for which we have their employee number, which is unique within each 
department but can be repeated for employees in different departments. Finally, employees can be in charge of other employees, and we want 
to store this information.

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/5_departments_and_employees.png">

</details>

# 6. Social Network

We are going to develop an application similar to Instagram where users can upload posts to their profile and follow other users.

Users will register with an email and password, but they will need to choose a unique username and a profile picture (the picture is 
optional) to complete the registration. If the data is valid, a profile will be automatically created for them upon registration.

A user can follow other users’ profiles to see their content and can upload posts to their own profile for others to see. Each post can 
have a maximum of 10 images, will also have an optional description, and we will store the post’s creation date.

Users will be able to write comments on other users’ posts or on their own posts. For each comment, we are interested in storing the text 
and the date it was published.

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/6_social_network.png">

</details>

# Challenge: Ecommerce

We want to create a marketplace similar to Amazon where users can create stores and sell their products online. Users will register with an 
email and password, and we will also store their full name.

For each store, we want to store its name and the user it belongs to, as well as the products it sells. For each product, we will store its
name, a description, the current stock, the current price, and the current discount. Additionally, some products may have different sizes 
and colors (for example, a monitor may be available in different resolutions and sizes), so we want to allow users to store this information. 
Finally, each product will have at least one image or several. Products are unique to each store, meaning that even if multiple stores sell 
the same product, each store has to create it separately in the application and add its name, images, etc.

Users, in addition to selling, can buy products from other stores. To do this, they will need to create an order in which we will store the 
products included, the quantity of each product, the color and size of each product (if applicable), the price of each product (since it 
can change in the future), and the discount applied (which can also change in the future). We will also calculate the total purchase price 
and add an invoice number to be able to send it to the buyer later.

Additionally, we need to know where to send the package, so users can associate multiple shipping addresses with their account and choose 
one when creating an order. The address will consist of the following fields: country, state/province, city, street, number, and optionally,
unit (apartment number, door, etc.). We will store this address along with the other order fields. Finally, since the order may take several
days to be prepared, shipped, and delivered, we want to store its status (“processing,” “shipped,” “delivered,” “canceled”).

<details>
<summary>Conceptual design</summary>

<img style="width: 100%;" src="./diagrams/conceptual/challenge_ecommerce.png">

</details>