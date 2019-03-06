# tty terminal gems - makes things a little easier and prettier in terminal
require 'tty-prompt'
require 'tty-box'
require 'colorize'

# csv gem allows us to work with csv files
require 'csv'

# use for debugging
require 'pry'


# bring in our 2 classes (User and Post) and a menu module
require './user.rb'
require './post.rb'
require './menu.rb'

# store header to have ready when we clear our terminal
def blogger_header 
    puts(`clear`)
    puts("-----------------------".white.on_black)
    puts("-Ruby Terminal Blogger-".white.on_black)
    puts("-----------------------".white.on_black)
end

blogger_header()

# all starts here!
initialize_menu()
