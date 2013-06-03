class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :deadline, :name
end
