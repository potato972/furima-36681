class CreateRecordDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :record_destinations do |t|

      t.timestamps
    end
  end
end
