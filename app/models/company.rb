class Company < ActiveRecord::Base
  
  external_url_regex = /(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?]))/
  
  validates :name, { :presence => true,
                     :uniqueness => { :case_sensitive => false },
                     :exclusion => { :in => %w[home contact about products product companies company login logout signup join register blog legal search feedback invite images image admin domesticated state states shop buy checkout cart],
                                     :message => "Name %{value} is taken." },
                     :length => { :in => 3..30 }} # replaced format of with a custom block
                     
  validates :external_url, {:presence => true,
                            :uniqueness => { :case_sensitive => false },
                            :format => { :with => external_url_regex },
                            :length => { :in => 4..300} }
  
end
