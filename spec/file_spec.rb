require 'rspec'
require_relative '../lib/modules/file_service'
require_relative '../lib/classes/app_constants'

# Include Modules
include FileService

describe Client do
  it 'Accept json file and return Hash' do
    expect(FileService.read(AppConstants::CLIENT_DATA_FILE))
  end
end
