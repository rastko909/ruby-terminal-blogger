# require 'tty-prompt'
# require 'pry'

def initialize_menu()

    puts 
    puts("\t1. Login?")
    puts("\t2. Create account? ")
    puts("\t3. Reset password? ")
    puts("\t4. Exit? ")
    puts 

    loop do
        print "What would you like to do? "
        user_input = gets().strip.downcase
      
        case user_input 
        when 'login'
            login()
        when '1'
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
    # use tty-prompt gem for fancier input
    puts
    prompt = TTY::Prompt.new
    result = prompt.collect do
        key(:username).ask('Username?') { |q| q.validate :email }
        key(:password).mask('Password?')
    end

    username = result[:username] 
    password = result[:password]

    
    @user_instance = User.new(username, password)
    check_if_login_valid = @user_instance.is_user?(username, password)

    if check_if_login_valid == true
        puts
        puts("Logged #{username} into Ruby Terminal Blogger!")

        current_user_id = @user_instance.return_user_id()

        # at this point we're golden, user is logged in and we can pass around the user_id to match up posts - rastko
        # using method: new_user_instance.return_user_id

        blog_menu(current_user_id)

    elsif check_if_login_valid == false
        puts("Either user doesn't exist or password is wrong... returning to menu...")
        puts
    end

end

def blog_menu(user_id)
    loop do
        puts 
        puts("User Options: ")
        puts
        puts("\t1. Create post?")
        puts("\t2. View posts")
        puts("\t3. Logout?")
        puts 
        print "What would you like to do? (create, view or logout) "
        user_input = gets().strip.downcase
      
        case user_input 
        when 'create'
            puts
            new_post = Post.new(user_id)
            new_post.create_post
        when '1'
            puts
            new_post = Post.new(user_id)
            new_post.create_post            
        when 'view'
            puts
            view_post = Post.new(user_id)
            post = view_post.view_post_from_csv(user_id)
            puts post
        when '2'
            puts
            view_post = Post.new(user_id)
            post = view_post.view_post_from_csv(user_id)
            puts post
        when 'logout'
            @user_instance.log_user_out()
        when '3'
            # log off here
            @user_instance.log_user_out()
        else
            puts
            puts "Command not recognized. Please try again."
            puts
        end
    end
end

def create_account()
end
