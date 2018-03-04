print "we seeding"


items = []
CSV.foreach('link/to/file.csv', headers: true) do |row|
  list = List.find_by(name: row[:name])
  items << User.new(list: list, title: row[:title])
end
User.import(items)