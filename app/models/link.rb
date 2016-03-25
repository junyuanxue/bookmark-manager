class Link

  include DataMapper::Resource

  has n, :tags, :through => Resources

  property :id,     Serial
  property :title,  String
  property :url,    String

end
