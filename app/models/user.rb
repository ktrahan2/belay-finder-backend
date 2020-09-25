class User < ApplicationRecord
    has_many :partnerships_as_requestor, foreign_key: :requestor_id, class_name: :Partnership
    has_many :partnerships_as_receiver, foreign_key: :receiver_id, class_name: :Partnership

    has_many :favorite_routes
    has_many :climbing_routes, through: :favorite_routes

    has_secure_password :validations => false
    
    validates :username, :name, presence: true
    validates :email, presence: true
    validates :password_digest, presence: { message: "Password is required!"}
    validates :username, :email, uniqueness: { message: "%{attribute} must be unique, %{value} has already been taken."}
    
end
