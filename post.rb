require 'csv'
require 'tty-prompt'
require 'tty-box'
require 'tty-font'
require 'pastel'
require 'pry'


class Post
    attr_accessor :user_id, :post_id, :title, :author, :date,  :keywords, :text
    def initialize()
        @user_id = ''
        @post_id = ''
        @title = ''
        @author = ''
        @date = ''
        @keywords = []
        @text = ''        
    end
  
    def assign_post_id()
    
    end

# gets user inputs for post title  
    def add_title()
        puts("Blog Title: ")
        @title = gets().strip().capitalize()
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
        @text = @prompt.multiline("My post: ")
        return @text
    end
    
# ask the user to add three keywords for the post  
    def ask_keywords()
        print("Keywords (3 maximum): ")
        @keyword_input = gets().strip().downcase
    end

# verify the keywords for 3 maximum   
    def add_keywords()
        ask_keywords()
        while (@keyword_input.split().length > 3 || @keyword_input.split().length <= 0)
            puts "invalid keywords amount"
            ask_keywords()
        end
            @keywords = @keyword_input.split()
        # print "Keywords: #{@keywords*", "}"
    end

# run all the methods to create a post    
    def create_post() 
        @prompt = TTY::Prompt.new
        puts("CREATE BLOG POST")
        add_title()
        add_author("1")
        add_date()
        add_text()
        add_keywords()

        #clear the terminal#
        view_post()      
    end

# to view the new post
    def view_post()
        return "Title: #{@title}\n By: #{@author}\n Date: #{@date}\n Keywords: #{@keywords*", "}\n 
        Post contents:\n #{@text}"
    end


# methods to write the new post to csv file
    def write_post_to_csv()

    end

end

post1 = Post.new()
first = post1.create_post
puts first
# binding.pry

