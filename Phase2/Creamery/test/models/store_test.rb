require 'test_helper'

class StoreTest < ActiveSupport::TestCase

  # Testing the relationships
  should have_many(:assignments)
  should have_many(:employees).through(:assignments)

  # Testing the validations 
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_uniqueness_of(:name).case_insensitive()

  # State test
  should allow_value("PA").for(:state)
  should allow_value("OH").for(:state)
  should allow_value("WV").for(:state)
  should_not allow_value("NY").for(:state)
  should_not allow_value("TN").for(:state)
  should_not allow_value("Doha").for(:state)
  should_not allow_value("25").for(:state)
  should_not allow_value(25).for(:state)
  should_not allow_value(nil).for(:state)

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

  # Zip test

  should allow_value("25007").for(:zip)
  should_not allow_value("Doha").for(:zip)
  should_not allow_value("2507").for(:zip)
  should_not allow_value("25072000").for(:zip)
  should_not allow_value("25-007").for(:zip)


end
