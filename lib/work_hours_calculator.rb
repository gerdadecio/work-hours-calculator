require 'time'
require 'optparse'

def calculate_hours(work_start, work_end, breaks)
  # Convert work start and end times to Time objects
  work_start_time = Time.parse(work_start)
  work_end_time = Time.parse(work_end)

  # Calculate total work time in seconds
  total_work_time = work_end_time - work_start_time

  # Calculate total break time in seconds
  total_break_time = breaks.reduce(0) do |sum, (start, end_time)|
    start_time = Time.parse(start)
    end_time = Time.parse(end_time)
    sum + (end_time - start_time)
  end

  # Subtract break time from total work time
  net_work_time = total_work_time - total_break_time

  # Convert time from seconds to hours
  total_work_hours = total_work_time / 3600.0
  total_break_hours = total_break_time / 3600.0
  net_work_hours = net_work_time / 3600.0

  return total_work_hours, total_break_hours, net_work_hours
end

# Parse command-line options
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: work_calculator.rb [options]"

  opts.on("-s", "--start-time START", "Work start time (e.g., '9:30:00 AM')") do |v|
    options[:start_time] = v
  end

  opts.on("-e", "--end-time END", "Work end time (e.g., '6:00:00 PM')") do |v|
    options[:end_time] = v
  end

  opts.on("-b", "--breaks x,y", Array, "Break periods as comma-separated pairs (e.g., '12:49:00 PM-1:26:00 PM,3:42:00 PM-4:35:00 PM')") do |v|
    options[:breaks] = v.map { |pair| pair.split('-') }
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end.parse!

# Validate input
if options[:start_time].nil? || options[:end_time].nil? || options[:breaks].nil?
  puts "Please provide start time, end time, and break times."
  exit
end

# Calculate and display results
total_work_hours, total_break_hours, net_work_hours = calculate_hours(options[:start_time], options[:end_time], options[:breaks])

puts "Total Work Hours: #{total_work_hours.round(2)} hours"
puts "Total Break Hours: #{total_break_hours.round(2)} hours"
puts "Net Work Hours: #{net_work_hours.round(2)} hours"
