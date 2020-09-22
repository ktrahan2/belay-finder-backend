class ClimbingRoute < ApplicationRecord
    has_many :favorite_routes
    has_many :users, through: :favorite_routes
end
