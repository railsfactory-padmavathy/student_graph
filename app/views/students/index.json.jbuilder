json.array!(@students) do |student|
  json.extract! student, :id, :name, :classroom_id, :section_id
  json.url student_url(student, format: :json)
end
