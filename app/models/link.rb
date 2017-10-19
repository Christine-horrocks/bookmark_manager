
class Link
  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id, Serial
  property :title, String
  property :url, String

  # has n, :tags, :through => Resource
end
