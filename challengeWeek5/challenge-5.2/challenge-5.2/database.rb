# Production code; do not change this class!!

class Database
  def initialize
    # Pretend this is very expensive connection code
    sleep(10)
    raise "could not connect to production database server"
  end

  def record_count
    # Pretend this is very expensive query code
    sleep(10)
    raise "could not connect to production database server"
  end

  def append(entry)
    # Pretend this is very expensive query code
    sleep(10)
    raise "could not connect to production database server"
  end

  def record_get_all
    # Pretend this is very expensive query code
    sleep(10)
    raise "could not connect to production database server"
  end
end

