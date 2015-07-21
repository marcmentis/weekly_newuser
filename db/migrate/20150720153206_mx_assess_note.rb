class MxAssessNote < ActiveRecord::Migration
  def change
  	create_table :mx_assess_notes do |t|
  		t.string :danger_yn
  		t.string :drugs_last_changed
  		t.string :drugs_not_why, limit: 4000
  		t.string :drugs_change_why, limit: 4000
  		t.string :psychsoc_last_changed
  		t.string :psychsoc_not_why, limit: 4000
  		t.string :psychsoc_change_why, limit: 4000
  		t.date :meeting_date
  		t.integer :patient_id
  		t.string :pre_date_yesno
  		t.string :pre_date_no_why, limit: 4000
  		t.date :pre_date
  		t.string :updated_by

  		t.timestamps
  	end
  	add_index :mx_assess_notes, :patient_id, name: 'index_mx_on_patient_id'
  end
end
