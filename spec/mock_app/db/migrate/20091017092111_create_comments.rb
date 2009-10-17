class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string  :title
      t.text    :content
      t.references :post
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
