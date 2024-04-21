require 'json'
require_relative 'file_service'
require_relative '../classes/app_constants'
require_relative 'client_service'

# include lib
include FileService
include ClientService

module AppService
  # App Flow
  def execute
    loop do
      # Instruction for customer
      puts AppConstants::SEARCH_INSTRUCTIONS
      choice = gets.chomp

      # Handling customer operations
      case choice
      when AppConstants::CUSTOMER_SEARCH
        # Search customer by name
        puts ClientService.search
      when AppConstants::FIND_DUPLICATES
        # Find duplicate entries from data set
        puts ClientService.find_duplicates
      when AppConstants::LIST_CLIENTS
        # List all clients
        ClientService.list_clients
      when AppConstants::EXIT
        # Exit Application
        puts AppConstants::EXIT_TEXT
        exit
      else
        # handling invalid
        puts "Please enter a valid operation"
      end
    end
  end
end
