class Employees
  attr_reader :name
  def initialize(name, ismanager)
    @name = name
    @manager = ismanager
  end
  
  def manager?
    if @manager
      true
    else
      false
    end
  end
end

def test_proc(employees)

  managers = employees.select{|e| e.manager?}
end
