require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(10.seconds, 'frequent.job') do
p "running the frequent job"
end

every(3.minutes, 'less.frequent.job') do
p "this job is less frequent"
array = [1,2,3,4]
p array
p "does this array include 4?"
p array.include?(4)
end

every(1.hour, 'hourly.job', :at => '**:08') do #hourly jobs run at the specified time
p 2+2
end

# every(1.day, 'midnight.job', :at => '00:00')
