require 'spec_helper'

describe Gallery do
  before(:each) do
      @gallery = Factory(:gallery)
  end

  should_validate_presence_of :name
  should_validate_uniqueness_of :name
end
