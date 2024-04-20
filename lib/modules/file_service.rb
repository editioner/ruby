require 'json'
require_relative '../classes/client'

module FileService
  def self.read(file_name)
    file = File.read(file_name)
    data_set = JSON.parse(file)

    data_set.collect { |item| Client.new(item["id"], item["full_name"], item["email"]).client }
  end
end