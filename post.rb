require 'colorize'
# our post class to add posts to user account
class Post
    attr_accessor :user_id, :post_id, :title, :author, :date,  :keywords, :text

    def initialize(user_id)
        @user_id = user_id
        @post_id = ''
        @title = ''
        @author = ''
        @date = ''
        @keywords = []
        @text = ''        
    end
  
    def index_post_id()
        post_id_array = []
        CSV.foreach('posts.csv', headers: true, header_converters: :symbol) do |row|
            # add every post_id to post_id_array to come up with next post id
            post_id_array << row[:post_id]
        end
        # returns highest post_id - if user creates a post, we simple +1 to this value to avoid conflicts
        @post_id_index = post_id_array.max()
        return @post_id_index
    end

    def assign_post_id()
        index_post_id()
        @post_id_index = @post_id_index.to_i
        @post_id_index += 1
        return @post_id_index
    end

# gets user inputs for post title  
    def add_title()
        print("Blog Title: ")
        @title = gets().strip().capitalize()
        @date = add_date()
        puts("Date: #{date}")
    end

# get author name from users.csv file    
    def add_author(user_id)
        CSV.foreach('users.csv', headers: true, header_converters: :symbol) do |row|
            csv_user_id = row[:user_id]
            if user_id == csv_user_id 
                @author = row[:name]
            end
        end
    end

# automatically generate data when the post created    
    def add_date()
        @date = Time.now.strftime("%d/%m/%Y")
        return @date
    end

# use tty-prompt gem to allow the user to write the post in multiple lines
    def add_text()
        # @text = @prompt.multiline("My post: ")
        # return @text
        puts("My post: ")
        @text_array = [] 

        @text = gets().chomp

        while @text != "quit"
            @text_array << @text 
            @text = gets().chomp
        end

        @joined_text = @text_array.join("\n")
        
        return @joined_text
    end

# run all the methods to create a post    
    def create_post() 
        puts `clear`
        puts("-----------------------".white.on_black)
        puts("------CREATE POST------".white.on_black)
        puts("-----------------------".white.on_black)
        puts
        @prompt = TTY::Prompt.new
        assign_post_id()
        add_title()
        add_author(user_id)
        add_date()
        add_text()
        
        # appends post to csv
        append_to_csv()
    end

    def view_post_from_csv(user_id)
        puts `clear`
        puts("-----------------------".white.on_black)
        puts("-----MY BLOG POSTS-----".white.on_black)
        puts("-----------------------".white.on_black)
        puts
        CSV.foreach('posts.csv', headers: true, header_converters: :symbol) do |row|
            csv_user_id = row[:user_id].to_s
            csv_post_id = row[:post_id].to_s
            csv_post_title = row[:title]
            csv_post_content = row[:text]
            csv_post_date = row[:date]
            csv_post_author = row[:name]
            puts("Title: '#{csv_post_title}'\nDate:\t#{csv_post_date}
                \n#{csv_post_content}\n\n-----------------------\n\n") if csv_user_id == user_id
        end
    end

    def append_to_csv()
        CSV.open('posts.csv', "ab") do |csv|
            csv << [@user_id, @post_id_index, @title, @author, @date, @joined_text]
        end
    end

end
