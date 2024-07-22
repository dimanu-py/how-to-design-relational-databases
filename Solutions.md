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