require 'csv'
require 'pry'
require './encryption.rb'

class User
    attr_accessor :user_id, :username, :name, :password

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

    def log_user_out()
        puts `clear`
        blogger_header()
        initialize_menu()
    end

    def return_user_id()
        return @user_id
    end

    def create_new_user()
        # create new user by inserting row into csv file
        # remember to get id count and add to it
        puts
        puts("Welcome!")
        new_user_prompt = TTY::Prompt.new
        new_user_result = prompt.collect do
            key(:new_username).ask('Username: (must be an email) ') { |q| q.validate :email }
            key(:new_password).ask('Password: (min. 6 characters with at least 1 number')
        end
    end

    def is_secret_phrase_valid?()
        # return true or false 
    end
    
    def reset_password()
        # invoke is_secret_phrase_valid?()
    end
end
