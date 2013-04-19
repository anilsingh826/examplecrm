class Product < ActiveRecord::Base
  serialize :data, ActiveRecord::Coders::Hstore
  belongs_to :user
  attr_accessible :name, :data,:user_id
  
  def as_json(options = {})
    {:name => name, :data => data}
  end
end
