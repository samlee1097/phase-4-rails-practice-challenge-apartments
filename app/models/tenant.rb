class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases

    validates :name, presence: true
    validate :minumum_age

    def minumum_age
        if age < 18
            errors.add(:age, "Need age more than 18")
        end
    end
end