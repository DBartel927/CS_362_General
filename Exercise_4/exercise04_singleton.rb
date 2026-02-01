class Sky

  @@instance_count = 0
  @instance = nil

  def self.instance
    @instance ||= new
  end

  private_class_method :new

  def initialize
    @@instance_count += 1
    @id = @@instance_count
  end

  def to_s
    "I am sky object #{@id} of #{@@instance_count} total instances."
  end
end


sky = Sky.instance
puts sky

another_sky = Sky.instance
puts another_sky

blood_red_sky = Sky.instance
puts blood_red_sky

pink_sky = Sky.instance
puts pink_sky