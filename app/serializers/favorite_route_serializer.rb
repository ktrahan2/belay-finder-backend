class FavoriteRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :climbing_route_id
end
