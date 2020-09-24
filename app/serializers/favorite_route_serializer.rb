class FavoriteRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :climbing_route_id, :user, :climbing_route, :id
end
