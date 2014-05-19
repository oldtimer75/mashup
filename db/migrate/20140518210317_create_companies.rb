class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :al_id
      t.boolean :community_profile
      t.string :name
      t.string :angellist_url
      t.string :logo_url
      t.string :thumb_url
      t.integer :quality
      t.string :product_desc
      t.string :high_concept
      t.integer :al_follower_count
      t.string :company_url
      t.string :crunchbase_url
      t.string :twitter_url
      t.string :blog_url
      t.string :video_url
      t.string :tags
      t.string :locations
      t.string :company_size
      t.string :company_type
    end
  end
end
