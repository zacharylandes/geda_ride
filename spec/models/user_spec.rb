require 'rails_helper'

RSpec.describe User, type: :model do
it { should have_many(:rides) }

it 'can login ' do
  auth = OpenStruct.new({"provider"=>"google_oauth2",
   "uid"=>"105341828830564931500",
   "info"=>
    OpenStruct.new({"name"=>"Zachary Landes",
     "email"=>"zach.g.landes@gmail.com",
     "first_name"=>"Zachary",
     "last_name"=>"Landes",
     "image"=>"https://lh6.googleusercontent.com/-nqXFjYbu3Ss/AAAAAAAAAAI/AAAAAAAA2Vo/KtuYDPoaoAs/photo.jpg",
     "urls"=>{"Google"=>"https://plus.google.com/105341828830564931500"}}),
   "credentials"=> OpenStruct.new(
    {"token"=>
      "ya29.GlxuBXxjrGjXWLeoXtNuFl2KX0gmmEEv2MUgvYzGbcNj9_GN7JuqapHPAr1yfdmGgDNTIm40aptjWIsr8QThqsmQFjUIv-XZ5q_u_oImZAT5hJnGF2Jkx-9yW5a77w",
     "expires_at"=>1519685467,
     "expires"=>true}),
   "extra"=>OpenStruct.new(
    {"id_token"=>
      "eyJhbGciOiJSUzI1NiIsImtpZCI6IjgzOWI5MjRiYjY1OWYwNzM1OGZkZjgyODhjZTU5ZjE4OWM0MDI4ZjQifQ.eyJhenAiOiI1MTgzODEzMzEwOTgtcjgxOGxtbmhtYWNiYzZhNW5kYTB2a2ZrZjR0MGRzNnMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI1MTgzODEzMzEwOTgtcjgxOGxtbmhtYWNiYzZhNW5kYTB2a2ZrZjR0MGRzNnMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDUzNDE4Mjg4MzA1NjQ5MzE1MDAiLCJlbWFpbCI6InphY2guZy5sYW5kZXNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiItZmV4RmFrSWlOZHZMYW1NZG4wQU5RIiwiZXhwIjoxNTE5Njg1NDY3LCJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNTE5NjgxODY3fQ.YE7zL77JcXBqrgXVWjp3vDGQB_pkiLn1myf2rj1GwPt93HR9vL0PGFEkkz-97mabHTAGFpuHyLAfQxFxtv_SjhwKBHap-lpO7YI5Y3vBLWGgiC54-LVvFxP52EAP4IzQ9shWiFFnTF3J7Fh7epsdZBvWGKyM90fvAFCvNofiC-hH7KRZ4eecNxIgDVP3t2bOeeqK-thMk24V7wFfTodk5r7Hl4932NJFgAVDafCS3qP2uT1X_weC3xNA3FNLjkjRs4q2Nu5wvyFBsEm4Ai0cPh09o1bAPKQtYsXAbNyRQKQCLrnpD1aD8lLVgCDVTbML1gUtduJAy47X4pjrWGXSAw",
     "raw_info"=>
      OpenStruct.new({"kind"=>"plus#personOpenIdConnect",
       "gender"=>"male",
       "sub"=>"105341828830564931500",
       "name"=>"Zachary Landes",
       "given_name"=>"Zachary",
       "family_name"=>"Landes",
       "profile"=>"https://plus.google.com/105341828830564931500",
       "picture"=>"https://lh6.googleusercontent.com/-nqXFjYbu3Ss/AAAAAAAAAAI/AAAAAAAA2Vo/KtuYDPoaoAs/photo.jpg?sz=50",
       "email"=>"zach.g.landes@gmail.com",
       "email_verified"=>"true",
       "locale"=>"en"})})})

  expect(User.from_omniauth(auth).class).to eq User
end
end
