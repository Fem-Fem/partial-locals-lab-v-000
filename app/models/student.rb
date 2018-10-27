# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(string)
    if string == ""
      return Student.all
    else
      array = []
      all = Student.all
      all.each do |student|
        if student.name.lowercase.include?(string)
          array << string
        end
      end
      return array
    end
  end
end
