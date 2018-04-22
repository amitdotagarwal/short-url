class CreateAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :analytics do |t|
     t.integer :url_id
      t.timestamps
    end
  end
end
