require 'csv'

class CsvParser

	def self.parse original_filename, new_filename=nil
		new_filename = new_filename || "parsed_#{original_filename}"
		file_path = "lib/assets/#{original_filename}"
		headers = [nil, "Cust Key", nil, "Last Name", nil, "First Name", nil, nil, "Birth Date", nil, "Age", nil, "Email Address"]
		customers_csv = CSV.read(file_path, headers:headers)
		customers = generate_customers(customers_csv)
		rows = generate_rows(customers)
		create_csv(new_filename, rows)
	end

	def self.generate_customers customers_csv
		customers = []
		counter = 1
		print "Parsing CSV\n"
		customers_csv[6..-1].each do |row|
			customer = Customer.new
			print "#{counter}... "
			counter += 1
			row.each do |attribute, value|
				case attribute
				when "Cust Key"
					customer.cust_key = value
				when "Last Name"
					customer.last_name = value.capitalize unless value.blank?
				when "First Name"
					customer.first_name = value.capitalize unless value.blank?
				when "Birth Date"
					customer.birthday = value
				when "Age"
					customer.age = value
				when "Email Address"
					customer.email = value
				end
			end
			find_parents(customer, customers)
			customers << customer
		end
		print "\n"
		customers
	end

	def self.find_parents customer, customers
		# last_name = customer.last_name.split('-')
		parent = customers.detect{|c| c.age > customer.age && c.email == customer.email }
		if parent
			parent.children << customer 
			customer.child = true
		end
	end

	def self.generate_rows customers
		customers = customers.select{|c| !c.child}
		rows = []
		customers.each do |c|
			children = c.children.map{|child| [child.first_name, child.birthday]}
			row = [c.last_name, c.first_name, c.birthday, children].flatten
			rows << row
		end
		rows
	end

	def self.create_csv new_filename, data
		headers = ["Last name", "First name", "Birthday", "Kid 1 First name", "Kid 1 Birthday", "Kid 2 First name", "Kid 2 Birthday", "Kid 3 First name", "Kid 3 Birthday"]
		CSV.open(new_filename, 'w') do |csv|
			csv << headers
			print "Creating New CSV\n"
			counter = 1
			data.each do |row|
				print "#{counter}... "
				csv.puts row
				counter += 1
			end
			print "\nFINISHED!"
		end
	end

end