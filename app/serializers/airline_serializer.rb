class AirlineSerializer
  include JSONAPI::Serializer
  attributes :name, :image_url, :slug
end
