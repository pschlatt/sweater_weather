class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :temperature, :summary, :duration
end
