class Dog < ApplicationRecord

    has_secure_password
    has_many :review
end