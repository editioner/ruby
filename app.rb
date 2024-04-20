require_relative 'lib/modules/app_service'
require_relative 'lib/modules/file_service'

# Include Modules
include FileService
include AppService

# Initialize data set to be accessible globally in this project
$data_set = FileService.read(AppConstants::CLIENT_DATA_FILE)

if $data_set
  puts "Client data loaded successfully"
end

# Welcome not
puts AppConstants::WELCOME_TEXT

# Initiate application
AppService.execute