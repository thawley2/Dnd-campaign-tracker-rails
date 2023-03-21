class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.string :dm_name
      t.boolean :first_dm
      t.integer :difficult_rating

      t.timestamps
    end
  end
end
