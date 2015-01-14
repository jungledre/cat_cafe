class CatsTags < ActiveRecord::Base
  belongs_to :cat
  belongs_to :tag
end
