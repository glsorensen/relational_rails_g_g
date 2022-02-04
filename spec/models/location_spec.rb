require 'rails_helper'

RSpec.describe Location do
  it {should have_many :dives}
end
