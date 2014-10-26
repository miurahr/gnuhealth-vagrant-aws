require 'csv'
require 'gdbm'

gdbm = GDBM.new("nmain314.db")
CSV.open("nmain314.csv", 'r') do |row|
  if row[7] == ""
    gdbm[row[6]] = row[2]
  end
end
gdbm.close
