require 'csv'
require 'gdbm'

ARGV.each do |a|
  source = a
  dest = File.basename(a, ".txt") + ".db"
  gdbm = GDBM.new(dest)
  CSV.open(source, 'r') do |row|
    if row[7] == ""
      gdbm[row[6]] = row[2]
    end
  end
  gdbm.close
end
