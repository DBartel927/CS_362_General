class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    # TODO: want to log here
    log(to)
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end

  def log(to)
    puts("#{@headers[:from]}, #{to}")
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

m.send("chris@example.com")