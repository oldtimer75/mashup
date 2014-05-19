namespace :companies do
  task :from_angellist => :environment do
    require 'open-uri'
		
    tag_id = ENV['tag_id']
    response =  Nokogiri::HTML(open("https://api.angel.co/1/tags/#{tag_id}/startups"))
    parsed_response = JSON.parse(response)
    pages = parsed_response["last_page"]
    
    (1..pages).to_a.each do |page|
      response =  Nokogiri::HTML(open("https://api.angel.co/1/tags/#{tag_id}/startups?page=#{page}"))
      parsed_response = JSON.parse(response)
      startups = parsed_response["startups"]

      startups.each do |startup|
        unless startup["hidden"] == true
          found_company = Company.where(al_id: startup["id"]).first
          if found_company
            found_company.update_attributes(community_profile: startup["community_profile"], name: startup["name"], angellist_url: startup["angellist_url"], logo_url: startup["logo_url"], thumb_url: startup["thumb_url"], quality: startup["quality"], product_desc: startup["product_desc"], high_concept: startup["high_concept"], al_follower_count: startup["follower_count"], company_url: startup["company_url"], crunchbase_url: startup["crunchbase_url"], twitter_url: startup["twitter_url"], blog_url: startup["blog_url"], video_url: startup["video_url"], company_size: startup["company_size"])
            found_company.tags = []
            startup["markets"].each do |market|
              found_company.tags << market["name"]
            end
            found_company.locations = []
            startup["locations"].each do |location|
              found_company.locations << location["name"]
            end
            found_company.company_type = []
            startup["company_type"].each do |type|
              found_company.company_type << type["name"]
            end
            found_company.save
            puts "updated company #{found_company.name}"
          else
            new_company = Company.new(al_id: startup["id"], community_profile: startup["community_profile"], name: startup["name"], angellist_url: startup["angellist_url"], logo_url: startup["logo_url"], thumb_url: startup["thumb_url"], quality: startup["quality"], product_desc: startup["product_desc"], high_concept: startup["high_concept"], al_follower_count: startup["follower_count"], company_url: startup["company_url"], crunchbase_url: startup["crunchbase_url"], twitter_url: startup["twitter_url"], blog_url: startup["blog_url"], video_url: startup["video_url"], company_size: startup["company_size"])
            new_company.tags = []
            startup["markets"].each do |market|
              new_company.tags << market["name"]
            end
            new_company.locations = []
            startup["locations"].each do |location|
              new_company.locations << location["name"]
            end
            new_company.company_type = []
            startup["company_type"].each do |type|
              new_company.company_type << type["name"]
            end
            new_company.save
            puts "new company #{new_company.name}"
          end
        end
      end
    end
  end
end