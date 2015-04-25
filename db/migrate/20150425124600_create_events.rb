class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string 'title'
      t.integer 'ownerid'
      t.datetime 'starttime'
      t.datetime 'endtime'
      t.datetime 'duration'
      t.string 'location'
      t.string 'status'
      t.text 'description'
      
      t.timestamps null: false
    end
  end
end
