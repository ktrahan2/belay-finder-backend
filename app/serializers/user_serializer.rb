class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :password_digest, :name, :aboutme, :climbing_skill, :partnerships_as_requestor, :partnerships_as_receiver
end
