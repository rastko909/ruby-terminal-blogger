require 'tty-prompt'
require 'pry'

def initialize_menu()

    puts 

    puts("1. Login?")
    puts("2. Create account? ")
    puts("3. Reset password? ")
    puts("4. Exit? ")

    puts 

    loop do
        print "What would you like to do? (login, create, reset, exit) "
        user_input = gets().strip.downcase
      
        case user_input 
        when 'login'
            login()
        when 'create'
            puts "create"
        when 'reset'
            puts "reset"
        when 'exit'
            puts "Exiting Ruby Terminal Blogger - See ya next time!"
            break
        else
            puts
            puts "Command not recognized. Please try again."
            puts
        end
    end

end

def login
    puts 

    username = gets().strip
    password = gets().strip

    
    new_user_instance = User.new(username, password)

    check_if_login_valid = new_user_instance.is_user?(username, password)

    p check_if_login_valid
    if check_if_login_valid == true
        puts "true"
        blog_menu()
    else
        puts "false"
    end
end

def blog_menu()
    puts 
    puts("1. Create post?")
    puts 

    loop do
        print "What would you like to do? (create) "
        user_input = gets().strip.downcase
      
        case user_input 
        when 'create'
            new_post = Post.new()
            new_post.create_post
            break
        else
            puts
            puts "Command not recognized. Please try again."
            puts
        end
    end
end

def create_account()
end


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

    # def create_account
#     prompt = TTY::Prompt.new
#     result = prompt.collect do
#         key(:username).ask('Username?')
#         key(:name).ask('Name?')
#         key(:age).ask('Age?', convert: :int)

#         # how to return results? 

#         choices = %w(Male Female Other)
#         prompt.multi_select("What's your gender?", choices)

#         key(:password).mask('Please create a password:')
#         key(:password).mask('Confirm password:')
#         # key(:address) do
#         #   key(:street).ask('Street?', required: true)
#         #   key(:city).ask('City?')
#         #   key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
#         # end
#       end
# end

