class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :city_name, default: ""
      t.integer :city_id, default: 0
      t.string  :country_code, default: ""
      t.integer :sunrise, default: 0
      t.integer :sunset, default: 0
      t.float   :wind_speed, default: 0.0
      t.integer :wind_degree, default: 0
      t.float   :temperature, default: 0.0
      t.float   :min_temp, default: 0.0
      t.float   :max_temp, default: 0.0
      t.integer :humidity, default: 0
      t.string  :weather_title, default: ""
      t.string  :weather_description, default: ""
      t.decimal :latitude, precision: 16, scale: 10
      t.decimal :longitude, precision: 16, scale: 10
      t.timestamps null: false
    end

    add_index :locations, :city_name
    add_index :locations, :city_id, unique: true
    add_index :locations, :country_code
  end
end
