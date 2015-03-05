class SmallCategory < ActiveRecord::Base
  belongs_to :large_category
end
