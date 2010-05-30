class Employees
  attr_reader :name, :office, :salary
  def initialize(name, ismanager, office, salary)
    @name = name
    @manager = ismanager
    @office = office
    @salary = salary
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
  offices = employees.collect{|e| e.office}
end

def managerOffices_proc(employees)
  managerOffices = employees.select{|e| e.manager?}.
                                  collect{|e| e.office}
end

def salary_total(employees)
  total = employees.inject(0){|sum, e| sum + e.salary}
end
