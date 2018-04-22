class Urls < ActiveRecord::Migration[5.1]
  def change
  	create_table :urls do |t|
      t.text :original_url
      t.string :short_url
      t.string :sanitized_url
      t.integer :count
      t.string :current_ip
      t.timestamps
    end
  end
end
