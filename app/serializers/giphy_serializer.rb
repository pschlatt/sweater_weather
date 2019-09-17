class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_type :images
  attributes :summary, :time, :url
end
