require 'net/http'

class NetThing
    def do_thing(req)
        req.do_thing()
    end
end

class RequestWrapper
    def initialize(req)
        @req = req
    end

    def do_thing
        if @req.to_hash.key?("x-special-header")
            return "OK"
        end
    end
    nil
end

class FakeRequestWrapper
    def initialize(req)
        @req = req
    end

    def do_thing()
        "OK"
    end
end

if __FILE__ == $0
  # Run this stuff if this file is executed directly
  # but not if it is `require`d

  nt = NetThing.new

  req = RequestWrapper.new(Net::HTTP::Get.new('http://example.com/'))
  pp nt.do_thing(req)   # nil

  req = RequestWrapper.new(Net::HTTP::Get.new('http://example.com/',
    {"x-special-header" => "Yes"}))
  pp nt.do_thing(req)   # "OK"
end