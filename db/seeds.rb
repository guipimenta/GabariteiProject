# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ROLES
Role.new(name: "Admin").save!
Role.new(name: "Student").save!
Role.new(name: "Teacher").save!

# PERMISSIONS
Permission.new({name: 'permission.take_part_in_courses'}).save!
