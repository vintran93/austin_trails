class AustinTrails::CLI
    
    def start
        welcome_user
        list_trails
        menu
    end

    def welcome_user
        puts "Welcome to Austin! This city is known for having many beautiful hiking trails.".colorize(:green)
    end

    def list_trails
        puts "Here are the top 10 hiking trails.".colorize(:green) 

        @details = AustinTrails::Hike.trail #class method called trail that returns all details for the names
        @details.each.with_index(1) do |hike, i|
            puts "#{i}. #{hike.name}"
        end
    end

    def valid_input?(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def menu
        input = nil
        until input == "exit"
            puts "Enter the number of the hike for more info or type list to see the options again or exit:".colorize(:green)
            input = gets.strip
            selected_hike = input.to_i
        
            if valid_input?(selected_hike, @details)
                selected_hike = @details[input.to_i-1] # we want the array index of the details
                puts "Here are the details for - #{selected_hike.name}".colorize(:green) + "\n" + "\n" + "#{selected_hike.description}".colorize(:green)
            elsif input == "list"
                list_trails
            elsif input == "exit"
                see_you_later
            else
                puts "That was an invalid answer, please type list or exit"
            end
        end
    end

    def see_you_later
        puts "Thanks for stopping by. See you next time!"
    end
end
