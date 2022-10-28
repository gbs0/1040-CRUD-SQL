require 'sqlite3'
require 'pry'
DB = SQLite3::Database.new("doctors.db")


class Doctor
    attr_reader :id
  
    def initialize(attributes = {})
      @id = attributes[:id]
      @name = attributes[:name]
      @specialty = attributes[:specialty]
      @age = attributes[:age]
      # TODO: store other attributes as instanced variable (exercise)
    end

    def save
      DB.execute('INSERT INTO doctors (name, age, specialty) VALUES (?, ?, ?);', @name, @age, @specialty)
      p DB.last_insert_row_id
    end

    def self.all
      
    end

    def self.display
      DB.results_as_hash = true
      doctors = DB.execute("SELECT * FROM doctors")
      doctors.each do |doctor|
        puts "ID: #{doctor["id"]} | name: #{doctor["name"]} | Specialty: #{doctor["specialty"]}"
      end
    end
end

# john = Doctor.new(name: "Peter Doe", age: 45, specialty: "Cardiac Surgeon")

# john.save
# p Doctor.all
Doctor.display