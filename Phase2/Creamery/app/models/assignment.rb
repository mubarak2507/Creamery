class Assignment < ApplicationRecord
  # Relationships
  belongs_to :store
  belongs_to :employee

  # Scopes
  scope :current,       -> { where("end_date IS NULL") } # if an assignment hasn't finished, there would be no end_date
  scope :past,          -> { where("end_date IS NOT NULL") } # if an assignment has been finished, an end_date will exist
  scope :for_store,     -> (store_id) { where("store_id = ?", store_id) }
  scope :for_employee,  -> (employee_id) { where("employee_id = ?", employee_id) }
  scope :for_role,      -> (role) { joins(:employee).where("role = ?", role) }
  scope :by_store,      -> { joins(:store).order("name") }
  scope :by_employee,   -> { joins(:employee).order("last_name, first_name") }
  scope :chronological, -> { order("start_date DESC, end_date DESC") }

  # Validations
  validates_presence_of :store_id
  validates_presence_of :employee_id
  validates_presence_of :start_date
  validates_date :start_date
  validates_date :end_date
  validate :valid_start_date
  validate :start_date_precedes_end_date
  validate :employee_is_active
  validate :store_is_active

  # Methods
  def valid_start_date # makes sure that the start date is not in the future
    if start_date > Date.current
      return false

    else
      return true

  end

  def start_date_precedes_end_date # makes sure that the start date precedes the end date
    if end_date.blank? || start_date.blank?
      return false

    if end_date < start_date
      return false

    else
      return true

  end

  def employee_is_active
    active_employees = Employee.active
    active_employees.include?(self.employee_id)
  end

  def store_is_active
    active_stores = Stores.active
    active_stores.include?(self.store_id)
  end

  def end_previous_assignment
    #was really stuck on this one lol
  end

end
