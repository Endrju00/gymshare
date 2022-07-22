# Gymshare

description

## Installation
- Build images ```docker-compose build```
- Run the containers ```docker-compose up```
- Create superuser/admin ```docker-compose exec web python manage.py createsuperuser``` - when containers are running
- To delete containers ```docker-compose down -v```

TODO:
- [ ] Add react to docker-compose
- [ ] Add dark/light theme switch

## Functionality
- [ ] U Create account
- [ ] UA Login to account
- [ ] UA Create workouts from exercises
- [ ] UA Run any workout from mobile app
- [ ] UA View profile with stats etc.
- [ ] UA Search/Filter other accounts
- [ ] UA Add to favorites
- [ ] A Create exercise
- [ ] A Edit/Delete any public workouts

User can download workout to phone and edit it (changes will be local).

### Additional functionality
- [ ] Chat room
- [ ] Instagram like workouts share (main page works similar to instagram)
- [ ] Friends list
- [ ] Rating public workouts

![Database Model](https://github.com/justdodo27/gymshare/blob/main/db_model.png)

### Exercises
- Title
- Description
- Difficulty tag
- Avg. calories burn rate
- Thumbnail
- Video/Gif
- Type (time, repeats)

### Exercise_workout (workout plan)
- FK Workout
- FK Exercise
- Order number
- Repeats - Optional
- Time - Optional if type series
- Series count - Optional if type time

### Workouts
- Author
- Title
- Description
- Sum of calories burn rate
- Difficulty (calculated from exercieses tags)
- Visibility (public, private)
- Foreign key to exercises
- Avg. time to complete
- Workout cycles

### Ratings
- FK User
- FK Workout
- Rate

### Stats_calories
- Date
- FK User
- Calories

### Stats_exercise
- Date
- FK User
- FK Exercise
- Repeats - Optional
- Time - Optional if type series
- Weight
