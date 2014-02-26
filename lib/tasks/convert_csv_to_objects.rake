require 'csv'

namespace :convert_csv_to_objects do
  task :create => :environment do
    csv_capoeirists = File.join(File.dirname(__FILE__), "Capoeiristes.csv")

    CSV.foreach(csv_capoeirists, :headers => true) do |row|
      puts row.to_hash
      Capoeirist.create!(row.to_hash)
    end
  end
  
  task :delete => :environment do
    Capoeirist.delete_all
  end
end
