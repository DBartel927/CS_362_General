class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    # TODO: want to log here
    puts("#{@headers[:from]}, #{to}")
    sendemail(to)
  end
end

# m = Email.new(
#   {:subject => "Hey!", :from => "beej@beej.us"},
#   "How's it going? Have you heard the latest gossip?"
# )

# m.send("chris@example.com")

def sendemail(to)
    s = connect()
    send_mail(s, to, @headers, @body)
    close(s)
end

class TestEmail < Email
    def sendemail(to)
    end
end

e = TestEmail.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

e.send