class AustinTrails::CLI
    
    def start
        welcome_user
        type_enter
    end

    def welcome_user
        puts    "________________________________________________________________________________________".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|     Welcome to Austin! This city is known for having many beautiful hiking trails.    |".colorize(:green)                      
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|            Looking for a new adventure in the hill country of Texas?                  |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                                                                                       |".colorize(:green)                               
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|                               Type enter to continue                                  |".colorize(:green)
        puts    "|///////////////////////////////////////////////////////////////////////////////////////|".colorize(:green)
        puts    "|_______________________________________________________________________________________|".colorize(:green)
    end

    def type_enter
        input = gets.strip
        if input == "enter"
            introduction 
        elsif input == "exit"
            see_you_later
        else 
            puts "That is an invalid answer, please type enter or exit".colorize(:yellow)
            type_enter
        end
    end  

    def introduction
        beginning = AustinTrails::Hike.trail[0]
        puts "#{beginning.heading}".strip.colorize(:green) + "\n" + "\n" + "#{beginning.intro}".strip.colorize(:green)

        list_trails
    end

    def list_trails
        puts "Here are the top 10 hiking trails in Austin, Texas.".colorize(:green)

        @details = AustinTrails::Hike.trail[1..10] #class method called trail that returns all details for the names
        @details.each.with_index(1) do |hike, index|
            puts "#{index}. #{hike.name}".colorize(:yellow)
        end 
        puts "Enter the number of the hike for more info or type list to see the options again or exit:".colorize(:green)
        menu
    end

    def valid_input?(input, data)
        input <= data.length && input > 0
        #binding.pry
    end

    def menu
        input = nil
        until input == "exit"
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
                puts "That was an invalid answer, please type list or exit".colorize(:yellow)
            end
        end
        exit
    end

    def see_you_later
        puts "Thanks for stopping by. See you next time!".colorize(:yellow)
    end
end
