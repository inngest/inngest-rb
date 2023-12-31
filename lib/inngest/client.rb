# lib/client.rb

class Inngest::Client
  attr_reader :id

  def initialize(args = {})
    raise "App ID is required" if args[:id].nil?

    @id = args[:id]
  end
end
