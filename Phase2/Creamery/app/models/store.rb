class Store < ApplicationRecord

    # Relationships
    has_many :assignments
    has_many :employees, through: :assignments

    # Scopes
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    scope :alphabetical, -> { order("name") }

    # Validations
    validates_presence_of :name
    validates_presence_of :street
    validates_presence_of :city
    validates_inclusion_of :state, in: %w["PA", "OH", "WV"], message: 'is not a valid state', allow_blank:true
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-. ]\d{4})\z/, message: "should be 10 digits and delimited with dashes only"
    validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"
    validates_uniqueness_of :name, case_sensitive: false

end