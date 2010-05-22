class Select
  def self.with_option(option)
    select = self.new
    select.options << option
    select
  end
  
  def options
    @options ||=[]
  end
  
  def add_option(arg)
    options << arg
    self
  end
end

def main_proc
  select = Select.with_option(1999).add_option(2000).add_option(2001).add_option(2002)
  select #=> #<select:0x28708 @options=[1999,2000,2001,2002]>
end
