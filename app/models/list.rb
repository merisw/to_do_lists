class List < ActiveRecord::Base
  has_many :tasks
  attr_accessible :items, :name
end
