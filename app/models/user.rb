class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :password, presence: true
    has_many:orders
end
