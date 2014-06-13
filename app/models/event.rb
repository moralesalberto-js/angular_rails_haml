class Event < ActiveRecord::Base
  validates_presence_of :title, :user_id, :start_time, :end_time
  belongs_to :user
end
