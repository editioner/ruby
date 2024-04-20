class Client
  attr_accessor :id, :full_name, :email

  def initialize(id, full_name, email)
    @id = id
    @full_name = full_name
    @email = email
  end

  def client
    {
      id: @id,
      full_name: @full_name,
      email: @email
    }
  end
end