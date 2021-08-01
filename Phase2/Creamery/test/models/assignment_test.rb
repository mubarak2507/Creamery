require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # Testing the Relationships
  
  should belong_to(:store)
  should belong_to(:employee)

  # Testing the Validations

  should validate_presence_of(:store_id)
  should validate_presence_of(:employee_id)

  # Testing the start and end dates

  should allow_value(Date.current.month - 3).for(:start_date)
  should allow_value(Date.current.year - 1).for(:start_date)
  should_not allow_value(Date.current.month + 2).for(:start_date)
  should_not allow_value("Ramadan").for(:start_date)
  should_not allow_value(nil).for(:start_date)

end
