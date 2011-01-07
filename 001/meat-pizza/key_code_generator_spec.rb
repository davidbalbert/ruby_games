# Pull in some spec settings.
require File.join( File.dirname(__FILE__), '..', '..', 'spec_helper' )

# 
# 


# Pull in all the Ruby files in this directory.
Dir.glob( File.join( File.dirname(__FILE__), '*.rb' ) ).each do |file|
  require file unless file.match /_spec.rb$/
end

# Here is the problem statement:
# generate 5000 random alpha numeric key codes
# do not use these characters
# 0, 1, 2, o, l, z
describe KeyCodeGenerator do

  @excludes = ['o','z','l',0,2,1]
  
  it "should be 5000 entries" do

    @reports << Benchmark.measure do
      @keycodes = KeyCodeGenerator.generate
      (@all & @excludes).length.should == 5000
    end
  end
  it "should exclude the list" do

    @reports << Benchmark.measure do
      @keycodes = KeyCodeGenerator.generate
      (@all & @excludes).should be_empty
    end
  end
end 



