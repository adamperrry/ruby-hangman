# HANGMAN - Ruby

This is a command line Hangman game written in Ruby for The Odin Project. This was my first time implementing serialization (with YAML) to save and load game objects. I tried to incorporate a lot of functionality in this game to make it fun to play!

The only class in this code is the Game class, meaning the only custom objects are Game instances. I probably could have tried harder to incorporate more of the core functionality into the Game object (or another object) to practice OOP, but it made just as much sense to do this procedurally/functionally using just the main script file. 

## Try it out!

You can preview this code [live on repl.it](https://repl.it/@adamperrry/ruby-hangman#.replit).

## Concepts

This project was fun to work on! I think my ASCII gallows looks really good, and I'm glad I got the save/load functionality working without any bugs. I would have liked to use JSON, since I find it more readable, but serializing custom objects with YAML is just so much easier. Marshall may be just as easy.

The script saves files with a name consisting of the current DateTime (with colons replaced for file name validity) combined with a custom name supplied by the user. I enjoy my solution for parsing these file names and displaying them on the "Load a saved game" page!
