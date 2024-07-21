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

- We identified two entities: `User` and `Task`.
- The `User` entity has the following attributes:
  - `email` -> marked as unique identifier
  - `password`
  - `name`
  - `id` -> marked as unique identifier. We've added this attribute to make it easier to reference the user in the future.
- The `Task` entity has the following attributes:
    - `title`
    - `description`
    - `due_date`
    - `id` -> marked as unique identifier. We've added this attribute to make it easier to reference the task in the future.
- The `User` entity can have from 0 to n tasks associated with it. 
- The `Task` entity can have only one user associated with it.

<img style="width: 100%;" src="./diagrams/conceptual/1_task_lists.png">

</details>