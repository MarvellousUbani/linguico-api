# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Appointment, type: :model do
    # Association test
    # ensure Todo model has a 1:m relationship with the Item model
    it { should belong_to(:user)}
    it { should belong_to(:teacher)}
    # Validation tests
    # ensure columns title and created_by are present before saving
    it { should validate_presence_of(:desc) }
    it { should validate_presence_of(:appointment_time) }
    it { should validate_presence_of(:appointment_date) }
end
