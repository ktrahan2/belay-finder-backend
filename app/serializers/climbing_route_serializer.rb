class ClimbingRouteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :style, :difficulty, :pitches, :location, :url
end
