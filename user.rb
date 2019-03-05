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
    end

    def is_user?(username, password)
        puts "WORKING"
        puts username
        puts password
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            csv_username = row[:username]
            csv_password = row[:password]
            # binding.pry
            if username == csv_username
                puts "found username"
                if password == csv_password
                    puts "password matches - RETURN TRUE"
                    return true
                else
                    puts "NO DICE FOOL  RETURN FALSE"
                    return false
                end
            end
        end
    end

    def list_file()
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            user_id = row[:user_id]
            name = row[:name]
            username = row[:username]
            password = row[:password]
            secret_phrase = row[:secret_phrase]
            puts "#{user_id} #{username} #{name} #{password} #{secret_phrase}"
        end
        # return true or false
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