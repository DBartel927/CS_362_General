# Use the sprout class method to refactor the Email class

def connect_to_mail_server
  puts "Connecting to mail server..."
  return "mail_server_connection"
end

def construct_and_send_email(server, to, headers, body)
  puts "Sending email to #{to} via #{server}"
  puts "Headers: #{headers}"
  puts "Body: #{body}"
end

class Logger
    def log(to)
        puts "Sending an email to #{to}"
    end
end

class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
    @server = connect_to_mail_server()
  end

  def send(to)
    # TODO: want to log here
    logger = Logger.new
    logger.log(to)
    construct_and_send_email(@server, to, @headers, @body)
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

m.send("chris@example.com")