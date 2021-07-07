50.times do
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    gender = Faker::Gender.binary_type.downcase
    birthday = Faker::Date.between(from: '01/01/2000', to: '01/01/2018')
    email = Faker::Internet.unique.email
    password = "password"
    User.create!(
        firstname: firstname,
        lastname: lastname,
        email: email,
        gender: gender,
        birthday: birthday,
        password: password
    )
end