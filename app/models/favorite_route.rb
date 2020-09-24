class FavoriteRoute < ApplicationRecord
    belongs_to :user
    belongs_to :climbing_route

end
