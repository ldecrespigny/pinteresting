class Crm < ActiveRecord::Base

def self.import(file)
  allowed_attributes = [ "title","summary","rating","created_at","updated_at"]
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    crm = find_by_id(row["id"]) || new
    crm.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
    crm.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end


end
