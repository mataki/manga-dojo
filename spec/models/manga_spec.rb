require File.dirname(__FILE__) + '/../spec_helper'

describe Manga do
  it "should be valid" do
    Manga.new.should be_valid
  end
end
