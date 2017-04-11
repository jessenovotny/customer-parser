# Customer Parser

This rails application was built for the purpose of completing a coding challenge.

# Challenge

Analyze the source data, identify a strategy / algorithm for manipulating it into the required format.
Develop a Python or Ruby script that can be executed from the command line. It should accept 2 parameters, the first is the input filename and is a mandatory parameter, the second is the output filename and is optional, in the event it is not provided you should use the input filename and add a prefix or suffix of your choice to show it is an output of your script.

# Instructions

Before testing, run the following to setup locally:
```
git clone git@github.com:jessenovotny/customer-parser.git
cd customer-parser
bundle
rake db:migrate
```

Source CSV file shall be located in the `lib/assets` directory.

running `rake parse:csv[customers-raw.csv,<optional_new_filename>]` will create a new file in the root directory named by the value provided as a second argument in the rake task or simply "parsed_customers-raw.csv" if no optional argument is provided.



