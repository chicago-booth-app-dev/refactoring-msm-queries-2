# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  has_many(:characters, { :class_name => "Character", :foreign_key => "actor_id" }) # direct relationship
  # def characters
  #   key = self.id
  #   the_many = Character.where({ :actor_id => key })
  #   return the_many
  # end

  has_many(:filmography, { :through => :characters, :source => :movie }) # intermediate relationship
  # many to many
  # def filmography # indirect relationship
  #   the_many = Array.new
  #   self.characters.each do |joining_record|
  #     destination_record = joining_record.movie
  #     the_many.push(destination_record)
  #   end
  #   return the_many
  # end

  has_many(:directors, { :through => :filmography, :source => :director })
end
