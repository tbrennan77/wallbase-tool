class CollectionSection < ActiveRecord::Base
  belongs_to :collection
  attr_accessible :title, :body
  validates_presence_of :title, :body
end
