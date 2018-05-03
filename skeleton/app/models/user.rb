# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :enrollments,
  foreign_key: :student_id,
  primary_key: :id,
  class_name: :Enrollment

  has_many :lessons,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :Course

  has_many :courses, through: :enrollments, source: :course
end
