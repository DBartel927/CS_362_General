require_relative "notebook.rb"
require "test/unit"

class FakeDatabase
  def initialize
    @data = []
  end

  def record_count
    @data.count
  end

  def append(entry)
    @data << entry
  end

  def record_get_all
    @data
  end
end

class TestNotebook < Test::Unit::TestCase

  def test_empty_notebook
    nb = Notebook.new("test notebook", FakeDatabase.new)
    assert_equal(nb.count_entries, 0)
  end

  def test_notebook_name
    nb = Notebook.new("test notebook", FakeDatabase.new)
    assert_equal(nb.name, "test notebook")
  end

  def test_single_entry_notebook
    nb = Notebook.new("test notebook", FakeDatabase.new)
    assert_equal(nb.count_entries, 0)
    nb.add_entry("entry 0")
    assert_equal(nb.count_entries, 1)
    ent = nb.get_entry(0)
    assert_equal(ent, "entry 0")
  end

  def test_multi_entry_notebook
    nb = Notebook.new("test notebook", FakeDatabase.new)
    assert_equal(nb.count_entries, 0)
    nb.add_entry("entry 0")
    nb.add_entry("entry 1")
    nb.add_entry("entry 2")
    nb.add_entry("entry 3")
    nb.add_entry("entry 4")
    assert_equal(nb.count_entries, 5)
    ent = nb.get_entry(0)
    assert_equal(ent, "entry 0")
    ent = nb.get_entry(2)
    assert_equal(ent, "entry 2")
    ent = nb.get_entry(4)
    assert_equal(ent, "entry 4")
  end
end
