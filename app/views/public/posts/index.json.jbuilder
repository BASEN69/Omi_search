json.data do
  json.items do
    json.array!(@posts) do |post|
      json.id post.id
      json.user do
        json.name post.user.name
      end
      json.images url_for(post.images.first) if post.images.attached?
      json.name post.name
      json.introduction post.introduction
      json.address post.address
      json.latitude post.latitude
      json.longitude post.longitude
    end
  end
end