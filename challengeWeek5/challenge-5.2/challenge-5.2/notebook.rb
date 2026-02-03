require_relative "database.rb"

class Notebook
  attr_reader :name

  def initialize(name, db)
    @name = name
    @db = db
  end

  def add_entry(entry)
    @db.append(entry)
  end
  
  def count_entries
    @db.record_count
  end

  def get_entry(n)
    all_entries = @db.record_get_all
    all_entries[n]
  end
end