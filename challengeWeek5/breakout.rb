# Make a new class (MessageSender) that just does the method in question (send()). This new class is the one we'll be testing!, not the original class.
# The constructor on MessageSender should have two parameters: an instance of a Message and an instance of a DatabaseConnection. (The constructor needs a reference to the Message if the method we're extracting refers to any instance variables (it does). And it needs a reference to all problematic dependencies of that method which, in this case, is the database connection.)
# Copy the send() code from the old class to the new one.
# In the old class's send() method, delete the old code.
# In the old class's send() method, instantiate a new instance of MessageSender. Pass in the necessary arguments to the constructor, self and @db.
# This won't run yet. The code in MessageSender::send has to be modified so that it refers to the Message object passed in the MessageSender constructor. Fix it.
# Try running the tests to make sure you don't have syntax errors. It will still timeout on the database at this point.
# Make a MockDatabaseConnection class. It needs the same methods as the real class, but they should do nothing.
# Make a MockMessage class. It needs the same constructor as Message and needs to keep the text that is passed in. And it needs the same attr_accessor. 1.
# Modify the tests to create a new MockDatabaseConnection, and new MockMessage with some text, and a new MessageSender object.
# Call send() on the MessageSender objert.
# Assert that the sent_message attribute of the MockMessage is now equal to the text you created it with.

require "minitest/autorun"

class DatabaseConnection
  # Pretend this is a real DB object
  def connect 
    sleep(10)
    raise "Database connection timed out"
  end

  def add_message(m)
    sleep(10)
    raise "Database insert timed out"
  end
end

class Message
  attr_accessor :text, :sent_message

  def initialize(text)
    @db = DatabaseConnection.new
    @text = text
    @sent_message = nil
  end

  def send()
    ms = MessageSender.new(self, @db)
    ms.send
  end
end

class TestMessage < MiniTest::Test
  def test_message

    m = Message.new("Hi there")

    db = MockDatabaseConnection.new

    ms = MessageSender.new(m, db)
    ms.send()
    assert_equal "Hi there", m.sent_message
  end
end

class MessageSender
  def initialize(message, db)
    @message = message
    @db = db
  end
    
  def send()
    @db.connect
    @db.add_message(@message.text)
    @message.sent_message = @message.text
  end
end

class MockDatabaseConnection
  def connect 
    sleep(2)
  end

  def add_message(m)
    sleep(2)
  end
end

class MockMessage
  attr_accessor :text, :sent_message

  def initialize(text)
    @text = text
  end
end