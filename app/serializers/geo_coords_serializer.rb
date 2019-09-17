class GeoCoordsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lat, :long
end
