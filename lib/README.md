# Work Hours Calculator CLI

Manually calculating work hours, breaks, and net hours in a spreadsheet can be tedious and prone to errors. To streamline the process and ensure accuracy, I created this CLI tool to handle the calculations quickly and easily.

## Description
This is a Ruby command-line tool for calculating the total work hours, break hours, and net work hours (after subtracting breaks) based on provided work start time, end time, and break periods.

## Features
- Calculate total work hours between start and end times.
- Account for multiple break periods.
- Return net work hours after subtracting break times.

## Prerequisites
- Ruby (>= 2.5)
- OptionParser (this is part of the Ruby Standard Library)

## Installation
Clone the repository or copy the script to your local machine.

Make the script executable by running:

```bash
chmod +x .lib/work_hours_calculator.rb
```

## Usage
Run the script from the command line with the required options for start time, end time, and break periods.

### Command Line Options
| Option | Description | Example |
| -------- | ------- | ------- |
| -s or --start-time | Specifies the work start time | `-s "9:30:00 AM"` |
| -e or --end-time | Specifies the work end time | `-e "6:00:00 PM"` |
| -b or --breaks | Specifies break periods in comma-separated start_time-end_time format | `-b "12:49:00 PM-1:26:00 PM,3:42:00 PM-4:35:00 PM"` |
| -h or --help | Displays help instructions | `-h` |

# Example
To calculate your work hours, run the following command:
```bash
ruby ./lib/work_hours_calculator.rb -s "9:30:00 AM" -e "7:00:00 PM" -b "12:49:00 PM-1:26:00 PM,3:42:00 PM-4:35:00 PM"
```

# Expected Output
```bash
Total Work Hours: 9.5 hours
Total Break Hours: 1.5 hours
Net Work Hours: 8.0 hours
```

# TODOs
- Add support for csv input and export result to csv
