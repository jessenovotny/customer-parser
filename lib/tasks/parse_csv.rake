namespace :parse do
	desc "Parses a CSV of customer data. Returns new CSV"
  task :csv, [:org_filename, :new_filename] => :environment do |t, args|
  	file_path = "lib/assets/#{args[:org_filename]}"
    if File.exist?(file_path)
    	CsvParser.parse(args[:org_filename], args[:new_filename])
    end
  end
end
