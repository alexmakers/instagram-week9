require 'spec_helper'

describe Photo do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
end
