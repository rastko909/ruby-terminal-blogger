# try to visualize application and work out a menu from this point 
require 'tty-prompt'
require 'tty-box'
require 'csv'

require './user.rb'
require './post.rb'

require './menu.rb'

puts `clear`

def blogger_header 
    puts("Ruby Terminal Blogger")
    puts("---------------------")
end

blogger_header()

initialize_menu()

# def create_post 
#     prompt = TTY::Prompt.new
#     print("Title: ")
#     title = gets().strip
#     puts("CREATE BLOG POST")
#     post = prompt.multiline("Blog post:")
#     print("Keywords (3 max): ")
#     keywords = gets().strip 
#     return post
# end

# create_post 

# prompt = TTY::Prompt.new
# choices = %w(Login Exit)

# prompt.multi_select("What would you like to do?", choices)

# puts prompt

# init menu 

    # login
        # Username? - Username is email  
        # Password? 
            # WELCOME RASTKO909@GMAIL.COM
            # ---------------------------
            # 1) Create post?
            # 2) View post?
            # 3) Edit post?
            # 4) Delete post?
                # 1 TITLE 
                # 2 TITLE
                # 3 TITLE

                # Delete ID? 1

            # Search?
            # Logoff? 

    # create account 
        # ask for username as an email
        # ask for full name
        # ask for password 2 times with condition of over 6 characters and 1 number 

    # forgot password?

        # Username? - IF NOT FOUND, REJECT AND RETURN TO MENU 

        # ASK USER: "What was the name of your first school?"
        # IF CORRECT
            # ask for password 2 times with condition of over 6 characters and 1 number 
        # IF NOT CORRECT
        # KEEP ASKING OR GIVE OPTION TO EXIT 
    # exit 



