require 'spec_helper'

describe Classroom do
  it { should belong_to(:user) }
end
