class CollectionSection < ActiveRecord::Base
  belongs_to :collection
  attr_accessible :title, :body
  validates_presence_of :title, :body

  def pretty_body
    results = ""
    body.each_line do |line|
      results += "#{line}<br />"
    end
    results.html_safe
  end
end
