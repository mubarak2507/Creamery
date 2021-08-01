require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  # Testing the relationships
  should have_many(:assignments)
  should have_many(:stores).through(:assignments)

  # Testing the validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:role)
  should validate_presence_of(:ssn)

  # Testing Date of Birth

  should allow_value(Date.current.year - 21).for(:date_of_birth)
  should allow_value(Date.current.year - 18).for(:date_of_birth)
  should allow_value(Date.current.year - 45).for(:date_of_birth)
  should_not allow_value("idk").for(:date_of_birth)
  should_not allow_value(nil).for(:date_of_birth)

  # Testing ssn

  should allow_value("331125070").for(:ssn)
  should_not allow_value("33112507").for(:ssn)
  should_not allow_value("331125072000").for(:ssn)
  should_not allow_value("idk").for(:ssn)
  should_not allow_value(nil).for(:ssn)

  # Phone test
  should allow_value("1234567890").for(:phone)
  should allow_value("3311250760").for(:phone)
  should allow_value("123-456-7890").for(:phone)
  should allow_value("331-125-0760").for(:phone)
  should allow_value("123.456.7890").for(:phone)
  should allow_value("331.125.0760").for(:phone)
  should allow_value("(123) 456-7890").for(:phone)
  should allow_value("(331) 125-0760").for(:phone)
  should_not allow_value("33112507").for(:phone)
  should_not allow_value("2507200033113160").for(:phone)
  should_not allow_value("mk33112507sm").for(:phone)
  should_not allow_value("331~125~0760").for(:phone)
  should_not allow_value("3311-2507-60").for(:phone)
  should_not allow_value(nil).for(:phone)

  # Role test

  should allow_value("admin").for(:role)
  should allow_value("manager").for(:role)
  should allow_value("employee").for(:role)
  should_not allow_value("boss").for(:role)
  should_not allow_value("assistant").for(:role)
  should_not allow_value(nil).for(:role)
  
end
