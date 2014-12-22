require 'rails_helper'

describe Idea do
  it { expect(subject).to validate_presence_of(:title) }
end