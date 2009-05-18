class Slide < ActiveRecord::Base   
  
  serialize :meta_data, Hash
  
end