# user_id,username,name,password,secret_phrase
require 'csv'
require 'pry'

class User
    attr_accessor :user_id, :username, :name, :password

    def initialize(username,password)
        @user_id = ""
        @username = username
        @name = ""
        @password = password

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
                if password == csv_password
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

    def cache_user_posts()

        # when user logs in, load posts.csv - find all posts by use if anu, create an ID index to appends
    end

    def return_user_id()
        return @user_id
    end

    def create_user()
        # create new user by inserting row into csv file
        # remember to get id count and add to it 
    end

    def is_secret_phrase_valid?()
        # return true or false 
    end
    
    def reset_password()
        # invoke is_secret_phrase_valid?()
    end
end

# NUMBER 1 BOOLSHIT CODE TO DISCARD 

# DIAGNOSTIC METHOD FOR CSV METHOD LEARNING
# def list_file()
#     CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
#         user_id = row[:user_id]
#         name = row[:name]
#         username = row[:username]
#         password = row[:password]
#         secret_phrase = row[:secret_phrase]
#         puts "#{user_id} #{username} #{name} #{password} #{secret_phrase}"
#     end
#     # return true or false
# end
