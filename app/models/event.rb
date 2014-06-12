class Event < ActiveRecord::Base
  validates_presence_of :start_time, :end_time, :title, :user_id
  belongs_to :user
end
