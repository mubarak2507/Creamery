class Employee < ApplicationRecord
    # Relationships
    has_many :assignments
    has_many :stores, through: :assignments

    # Scopes
    scope :younger_than_18, -> { where("(Date.current.year - date_of_birth.year ) < 18") }
    scope :is_18_or_older,  -> { where("(Date.current.year - date_of_birth.year ) => 18") }
    scope :active,          -> { where(active: true) }
    scope :inactive,        -> { where(active: false) }
    scope :regulars,        -> { where(role: "employee") }
    scope :managers,        -> { where(role: "manager") }
    scope :admins,          -> { where(role: "admin") }
    scope :alphabetical,    -> { order("name") }

    # Validations
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :role
    validates_presence_of :ssn
    validates_date :date_of_birth
    validates_format_of :ssn, with: /\A(\d{9}|\(?\d{3}\)?[-. ]\d{2}[-. ]\d{4})\z/, message: "should be 9 digits and delimited with dashes only"
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-. ]\d{4})\z/, message: "should be 10 digits and delimited with dashes only"
    

    # Methods
    def name
        last_name + ", " + first_name
    end
    
    def proper_name
        first_name + " " + last_name
    end

    def current_assignment
        curr_ass = self.assignment.current    
        return nil if curr_ass.empty?
        curr_ass # returns the available current assignment
    end

    def over_18?
        if (Date.current.year - date_of_birth.year ) < 18
            return false
        else
            return true
    end

    def age
        Date.current.year - date_of_birth.year
    end

end
