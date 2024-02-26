require 'csv'

class CsvProcessor
  def call(csv_file)
    result = []
    CSV.foreach((csv_file), headers: true, col_sep: ",") do |row|
      result << row
    end
    result
  end
end
