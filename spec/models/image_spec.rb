require 'spec_helper'

describe Image do
  before(:each) do
      @image = Factory(:image)
  end
  should_belong_to :gallery
end