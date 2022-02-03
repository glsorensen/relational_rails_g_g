require 'rails_helper'

RSpec.describe Dive, type: :model do
  it {should belong_to :location}
end 
