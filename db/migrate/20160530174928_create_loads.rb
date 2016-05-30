class CreateLoads < ActiveRecord::Migration
    def self.up
      create_table :loads do |t|
        t.text :hourly_loads
        t.string :time
        t.timestamps
      end
    end
    def self.down
      drop_table :loads
    end
end
