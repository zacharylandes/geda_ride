require 'rails_helper'
RSpec.describe Origin, type: :model do
it { should belong_to(:ride) }
end
