# our main menu 
def initialize_menu()
    puts 
    puts("\t1. Login?".colorize(:blue))
    puts("\t2. Create account? ".colorize(:blue))
    puts("\t3. Exit? ".colorize(:blue))
    puts 

    # loop through menu features
    loop do
        print "What would you like to do? (login, create, reset, exit) "
        user_input = gets().strip.downcase
      
        case user_input 
        when 'login'
            login()
        when '1'
            login()
        when 'create'
            new_user = User.new("","")
            new_user.create_new_user()
        when '2'
            new_user = User.new("","")
            new_user.create_new_user()
        when 'exit'
            puts "Exiting Ruby Terminal Blogger - See ya next time!".colorize(:green)
            break
        when '3'
            puts "Exiting Ruby Terminal Blogger - See ya next time!".colorize(:green)
            break
        else
            puts
            puts "Command not recognized. Please try again.".colorize(:red)
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
    # create user instance 
    @user_instance = User.new(username, password)
    check_if_login_valid = @user_instance.is_user?(username, password)
    # check if login is valid
    if check_if_login_valid == true
        puts
        puts("Logged #{username} into Ruby Terminal Blogger!".colorize(:green))

        current_user_id = @user_instance.return_user_id()

        # at this point we're golden, user is logged in and we can pass around the user_id to match up posts - rastko
        # using method: new_user_instance.return_user_id

        blog_menu(current_user_id)

    elsif check_if_login_valid == false
        puts("Either user doesn't exist or password is wrong... returning to menu...".colorize(:red))
        puts
    end

end
# menu for our user who is logged in 
def blog_menu(user_id)
    loop do
        puts 
        puts("User Options: ")
        puts
        puts("\t1. Create post?".colorize(:blue))
        puts("\t2. View posts?".colorize(:blue))
        puts("\t3. Logout?".colorize(:blue))
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
            puts "Command not recognized. Please try again.".colorize(:red)
            puts
        end
    end
end
