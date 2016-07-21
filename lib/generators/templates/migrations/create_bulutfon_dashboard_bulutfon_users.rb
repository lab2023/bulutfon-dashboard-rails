class CreateBulutfonDashboardBulutfonUsers < ActiveRecord::Migration
  def up
    create_table :bulutfon_dashboard_bulutfon_users do |t|
      t.references :user, index: true, foreign_key: true
      t.string :api_token
      t.string :sms_title

      t.timestamps null: false
    end
  end

  def down
    drop_table :bulutfon_dashboard_bulutfon_users
  end
end
