class Company < ActiveRecord::Base
  serialize :tags
  serialize :company_type
  serialize :locations
end
