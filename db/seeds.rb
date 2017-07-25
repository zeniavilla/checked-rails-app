# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[Team, User, Chore, Category].each {|obj| obj.destroy_all}  

DATA = {
    :users => [
        "Claire Dunphy",
        "Phil Dunphy",
        "Haley Dunphy",
        "Alex Dunphy",
        "Luke Dunphy"
    ],
    :chore_keys => ["title", "category_id", "user_id", "duration_end_date", "frequency_amount", "frequency_interval"]
}

dunphys = Team.create(name: 'Dunphys')

DATA[:users].each do |user|
    first_name = user.split(' ')[0].downcase
    instance_variable_set("@#{first_name}", dunphys.users.create(name: user, email: "#{first_name}@email.com", password: 'password', password_digest: BCrypt::Password.create('password'))) 
end

CHORES = [
    ["Find a job", Category.find_or_create_by(title: "Work").id, @haley.id, "2017-08-02 15:29:01.753028", nil, nil],
    ["Scrub toilet", Category.find_or_create_by(title: "Upstairs Bathroom").id, @haley.id, "2017-08-25 15:29:01.753028", 1, 'weeks'],
    ["Mow lawn", Category.find_or_create_by(title: "Outdoors").id, @luke.id, "2017-08-30 15:29:01.753028", 1, 'weeks'],
    ["Mop floor", Category.find_or_create_by(title: "Kitchen").id, @luke.id, "2017-08-25 15:29:01.753028", 4, 'days'],
    ["Scrub toilet", Category.find_or_create_by(title: "Downstairs Bathroom").id, @alex.id, "2017-08-10 15:29:01.753028", 1, 'weeks'],
    ["Clean mirrors and window", Category.find_or_create_by(title: "Downstairs Bathroom").id, @alex.id, "2017-08-20 15:29:01.753028", 3, 'days'],
    ["Clean counters", Category.find_or_create_by(title: "Kitchen").id, @claire.id, "2017-08-15 15:29:01.753028", 3, 'days']
]

CHORES.each do |chore|
    new_chore = Chore.new
    chore.each_with_index do |attribute, i|
        new_chore.send(DATA[:chore_keys][i] + "=", attribute)
    end
    new_chore.save
end