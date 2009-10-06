class CreateHelloWorlds < ActiveRecord::Migration
  def self.up
    create_table :hello_worlds do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :hello_worlds
  end
end
