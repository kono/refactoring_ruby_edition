class Select
  def options
    @options ||=[]
  end
  
  def add_option(arg)
    options << arg
  end
end

def main_proc
  select = Select.new
  select.add_option(1999)
  select.add_option(2000)
  select.add_option(2001)
  select.add_option(2002)
  select #=> #<select:0x28708 @options=[1999,2000,2001,2002]>
end
