require 'csv'
require 'gdbm'

gdbm = GDBM.new("nmain314.db")
CSV.open("nmain314.csv", 'r') do |row|
  gdbm[row[7]] = row[3]
end
gdbm.close
