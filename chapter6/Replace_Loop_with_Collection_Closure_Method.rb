class Employees
  attr_reader :name, :office
  def initialize(name, ismanager, office)
    @name = name
    @manager = ismanager
    @office = office
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

def office_proc(employees)
  offices = []
  employees.each{|e| offices << e.office}
  return offices
end
