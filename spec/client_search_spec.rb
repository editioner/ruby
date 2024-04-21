require 'rspec'
require_relative '../lib/modules/client_service'
require_relative '../lib/modules/file_service'
require_relative '../lib/classes/app_constants'

# Include Modules
include FileService
include ClientService

# Initialize data set to be accessible globally in this project
$data_set = FileService.read(AppConstants::CLIENT_DATA_FILE)

describe Client do

  it 'Search clients by name' do
    expect(ClientService.search_customer('John'))
  end

end
