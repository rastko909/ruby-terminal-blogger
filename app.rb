# tty terminal gems - makes things a little easier and prettier in terminal
require 'tty-prompt'
require 'tty-box'

# csv gem allows us to work with csv files
require 'csv'

# use for debugging
require 'pry'

# bring in our 2 classes (User and Post) and a menu module
require './user.rb'
require './post.rb'
require './menu.rb'

def blogger_header 
    puts(`clear`)
    puts("-----------------------")
    puts("-Ruby Terminal Blogger-")
    puts("-----------------------")
end

blogger_header()

initialize_menu()
