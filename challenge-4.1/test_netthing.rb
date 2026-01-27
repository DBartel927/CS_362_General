require 'minitest/autorun'
require_relative 'netthing'

class NetThingTest < Minitest::Test
  def test_do_thing_no_param()
    nt = NetThing.new
    # DON'T WANT TO MAKE A REAL REQUEST HERE
    #req = Net::HTTP::Get.new('http://example.com/')
    req = FakeRequest.new
    result = nt.do_thing(req)
    assert result == nil
  end

  def test_do_thing_with_param()
    nt = NetThing.new
    # DON'T WANT TO MAKE A REAL REQUEST HERE
    #req = Net::HTTP::Get.new('http://example.com/',
    #  {"x-special-header" => "Yes"})
    req = FakeRequest.new({"x-special-header" => "Yes"})
    result = nt.do_thing(req)
    assert result == "OK"
  end
end

class FakeRequest
  def initialize(headers = {})
    @headers = headers
  end

  def to_hash
    @headers
  end
end