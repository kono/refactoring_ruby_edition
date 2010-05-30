require 'rubygems'
require 'test/unit'
require 'must'
require 'kconv'
require 'Replace_Loop_with_Collection_Closure_Method'

$KCODE="UTF8"
class Replace_Loop_with_Collection_Closure_Method < Test::Unit::TestCase

  def assert(status,msg)
    if(RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/)
      msg=Kconv.tosjis(msg)
    end
    super(status,msg)
  end
  

  must "test_test_proc" do
    employees = []
    employees << Employees.new("Alan", true, "Japan")
    employees << Employees.new("Barbara", false, "Japan")
    employees << Employees.new("Charlie", false, "USA")
    employees << Employees.new("Diana",true, "USA")
    
    manager_name = []
    
    test_proc(employees).each do |e|
      manager_name << e.name
    end
    
    assert_not_nil( manager_name.index("Alan"))
    assert_nil( manager_name.index("Barbara"))
    assert_nil( manager_name.index("Charlie"))
    assert_not_nil( manager_name.index("Diana"))
    
    office_ar= office_proc(employees)
    assert_not_nil(office_ar.index("Japan"))
    assert_not_nil(office_ar.index("USA"))
    
    managerOffice_ar = managerOffices_proc(employees)
    assert_not_nil(managerOffice_ar.index("Japan"))
    assert_not_nil(managerOffice_ar.index("USA"))
    assert_equal(managerOffice_ar.length, 2)

  end
  
end
