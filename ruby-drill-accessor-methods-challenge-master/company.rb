class Company

  def initialize(name, employees = [])
    @company_name = name
    @employees    = employees
  end

  def company_name
    @company_name
  end

  def company_name=(new_name)
    @company_name = new_name
  end

  def add_employee(employee)
    @employees << employee
  end

  def employees
    @employees
  end
end
