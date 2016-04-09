# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({full_name: 'Johnny B. Good',
                    email: 'johnny@email.com',
                    country: 'Brasil',
                    state: 'ES',
                    city: 'Serra',
                    address: 'Rodovia ES 010',
                    phone_number: '123456789',
                    user_type: 'Donor',
                    password: 'abcd',
                    password_confirmation: 'abcd'})

project = Project.create({  name: 'Testing',
                            description: 'Testing',
                            project_type: 'testing',
                            user_id: user.id})
