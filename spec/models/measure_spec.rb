require 'rails_helper'

RSpec.describe Measure, type: :model do
  it { should belong_to(:user) }
end
