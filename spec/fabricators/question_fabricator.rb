Fabricator(:question) do
	title {Faker::Lorem.sentence(6)}
	detail {Faker::Lorem.sentences}
	user_id { rand(6) }
	classroom_id { rand(6) }
end