class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :password_digest, :name, :aboutme, :climbing_skill, :climbing_style, :location, :belay_status, :favorite_routes, :partnerships_as_requestor, :partnerships_as_receiver
end
