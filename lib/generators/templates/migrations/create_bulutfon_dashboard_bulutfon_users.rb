class CreateBulutfonDashboardBulutfonUsers < ActiveRecord::Migration
  def up
    create_table :bulutfon_dashboard_bulutfon_users do |t|
      t.integer :user, index: true
      t.string :api_token

      t.timestamps null: false
    end
  end

  def down
    drop_table :bulutfon_dashboard_bulutfon_users
  end
end
