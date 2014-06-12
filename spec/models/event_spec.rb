require 'rails_helper'

RSpec.describe Event, :type => :model do
  it { expect(subject).to validate_presence_of :start_time }
  it { expect(subject).to validate_presence_of :end_time }
  it { expect(subject).to validate_presence_of :title }
  it { expect(subject).to belong_to :user }
end
