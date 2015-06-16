# == Schema Information
#
# Table name: user_course_roles
#
#  user_id    :integer
#  course_id  :integer
#  role       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserCourseRole < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :course
  
end
