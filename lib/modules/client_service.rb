module ClientService
  # Search customer function
  def search(data_set)
    loop do
      puts AppConstants::CUSTOMER_SEARCH_TEXT
      search_query = gets.chomp

      if search_query.empty?
        puts "Please provide a valid client name.\n"
      elsif search_query == 'q'
        puts AppConstants::EXIT_TEXT
        exit
      elsif search_query == 'b'
        AppService.execute
      else
        customers = []
        data_set.select { |item|
          if item[:full_name].downcase.include? search_query.downcase
            customers.push(item)
          end }
        if customers.empty?
          print "Given client does not match with our system.\n\n"
        else
          json_formatter(customers)
        end
      end
    end
  end

  # Find duplicate data from data set
  def find_duplicates(data_set)
    duplicate_data = []
    data_set.group_by { |customer| customer[:email] }.values.select { |customers|
      if customers.size > 1
        duplicate_data.push(customers)
      end
    }

    if duplicate_data
      puts json_formatter(duplicate_data)
      puts "Would you like to export duplicate data? Type 'yes' or 'no'\n\n"
      action = gets.chomp.downcase

      if action == 'yes' || action == 'y'
        time = Time.now.to_i
        file = File.new("./data/duplicates/client_duplicates#{time}.json", "w")
        file.puts(JSON.pretty_generate duplicate_data)
        file.close
      else
        AppService.execute
      end
    end
  end

  # List all clients
  def list_clients
    json_formatter($data_set)
  end

  # Format Json
  def json_formatter(data)
    puts JSON.pretty_generate data
    puts "\n"
  end
end
