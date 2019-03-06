require 'csv'
require 'tty-prompt'
require './encryption.rb'

class User
    attr_accessor :user_id, :username, :name, :password
    # init user instance 
    def initialize(username,password)
        @user_id = ""
        @username = username
        @name = ""
        # use encrypt method to hash password in the csv file 
        @password = encrypt(password)
        @index_user_csv = index_csv()
    end
    
    def index_csv()
        csv_count_users = 0
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            csv_count_users += 1 
        end
        return csv_count_users
    end

    # checks if user exists
    def is_user?(username, password)
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            csv_username = row[:username]
            csv_password = row[:password]
            @user_id = row[:user_id]
            if username == csv_username
                if encrypt(password) == csv_password
                    return true
                else
                    return false
                end
            end
        end
    end

    # log user out, restart the menu
    def log_user_out()
        puts `clear`
        blogger_header()
        initialize_menu()
    end

    def return_user_id()
        return @user_id
    end

    def create_new_user()
        # let's create a user id
        # we cheat a little here, this cycles through the users csv file and just counts the number of users then 
        # we just add 1 to avoid user conflicts
        @new_user_index = 0
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            @new_user_index += 1
        end
        @new_user_index += 1

        # create new user by inserting row into csv file
        # remember to get id count and add to it
        puts
        puts("-----------------------".white.on_black)
        puts("-----Registration------".white.on_black)
        puts("-----------------------".white.on_black)
        puts

        new_prompt = TTY::Prompt.new
        new_result = new_prompt.collect do

            key(:username).ask('Username? (Use an email address!)') { |q| q.validate :email }
            # got it working but barely 
            @pass_1 = 'one'
            @pass_2 = 'two' 
            # check that passwords match
            while (@pass_1 != @pass_2)
                @pass_1 = key(:password).mask('Password?')
                @pass_2 = key(:password_confirm).mask('Confirm password?')

                if @pass_1 == @pass_2 
                    @match == true
                else
                    @match == false
                    puts
                    puts("Passwords don't match! Try again... ".colorize(:red))
                    puts()
                    @pass_1 = key(:password).mask('Password?')
                    @pass_2 = key(:password_confirm).mask('Confirm password?')
                    puts
                end
            end      

            key(:name).ask("What's your full name? ")
            puts
            puts("Incase you lose your password, we will ask you for a secruity question.")
            key(:secret_phase).ask("Where did you first go to school? (Use one word to keep things simple, eg. 'St Joseph's Primary' could be 'Joseph')")
            puts
            puts `clear`
            puts "User registration complete!".colorize(:green)
            puts
            puts("-----------------------".white.on_black)
            puts("-Ruby Terminal Blogger-".white.on_black)
            puts("-----------------------".white.on_black)
            puts
        end

        @new_username = new_result[:username]
        @new_password = encrypt(new_result[:password])
        @new_name = new_result[:name]
        @new_secret_phrase = new_result[:secret_phase].downcase

        CSV.open('users.csv', "ab") do |csv|
            csv << [@new_user_index, @new_username, @new_name, @new_password, @new_secret_phrase]
        end

    end

    # we were close to completing this feature but CSV is too hard to edit without re-writing whole CSV file again
    # we can implement sometime in the future with more time
    
    # def reset_password()
    #     puts
    #     puts("----------------")
    #     puts("-Reset Password-")
    #     puts("----------------")
    #     puts

    #     reset_prompt = TTY::Prompt.new
    #     reset_result = reset_prompt.collect do
    #         key(:username).ask('Username? (Use an email address!)') { |q| q.validate :email }
    #     end

    #     search_username = reset_result[:username]

    #     CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
    #         csv_username = row[:username] 
    #         # csv_secret_phrase = row[:secret_phrase]
    #         if (search_username == csv_username)
    #             csv_secret_phrase = row[:secret_phrase]
    #             puts("Okay. Found your username!")
    #             puts("What school did you go to? Hint: The answer will be one word.")
    #             input = gets().strip.downcase
    #             if (input == csv_secret_phrase)
                    
    #             else
    #                 puts("DON'T GOT IT")
    #             end
    #         end
    #     end
    # end
end
