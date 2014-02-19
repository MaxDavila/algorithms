# Mars Rover!

This is an implementation of the Mars Rover problem. 

The script takes an txt file as an input--in this case ```test_input.txt```-- and 
outputs the final position of the Rover along with its orientation.

### Structure of test_input.txt

  ````
  5 5
  1 2 N
  LMLMLMLMM
  3 3 E
  MMRMMRMRRM
  ```

  - The first line of the file create the plateau.

  - The next and every even line is used to instantiate the rovers with their 
    respective position and orientation in the plateau. 

  - The next line are directives for the Rover that can be either 'M' to move 
    forward one square on the orientation the rover is currently facing or 'R' 
    or 'L' to rotate 90 degrees on either direction. 

The current implementation prints a message on the screen if your rover falls off
the plateau. 

### Setup

Make sure you have rspec intalled. If not you can run 
```
  gem install rspec
```

First make sure all the test are passing
```
  rspec spec/
```

To run the simulation run 
```
  ruby rovers_controller.rb 
```
  
