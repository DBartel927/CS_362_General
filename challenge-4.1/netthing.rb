require 'net/http'

class NetThing
  def do_thing(req)
    if req.to_hash.key?("x-special-header")
      return "OK"
    end
    nil
  end
end

if __FILE__ == $0
  # Run this stuff if this file is executed directly
  # but not if it is `require`d

  nt = NetThing.new

  req = Net::HTTP::Get.new('http://example.com/')
  pp nt.do_thing(req)   # nil

  req = Net::HTTP::Get.new('http://example.com/',
    {"x-special-header" => "Yes"})
  pp nt.do_thing(req)   # "OK"
end