class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, default: ""
      t.text :description
      t.string :state, default:  "draft"
      t.date :start_date
      t.date :end_date
      t.string :location, default: ""
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :group_events, :deleted_at
  end
end
