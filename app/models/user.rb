class User < ApplicationRecord
    has_many :partnerships_as_requestor, foreign_key: :requestor_id, class_name: :Partnership
    has_many :partnerships_as_receiver, foreign_key: :receiver_id, class_name: :Partnership

    has_many :favorite_routes
    has_many :climbing_routes, through: :favorite_routes

    has_secure_password :validations => false
    
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: { message: "Password is required!"}
    validates :username, :email, uniqueness: { message: "%{attribute} must be unique, %{value} has already been taken."}
    validates :password, length: {
        minimum: 6,
        maximum: 15,
        message: "Password length must be between 6 and 15 characters."
    }
end
