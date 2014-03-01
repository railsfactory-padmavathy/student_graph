json.array!(@sections) do |section|
  json.extract! section, :id, :section, :classroom_id
  json.url section_url(section, format: :json)
end
