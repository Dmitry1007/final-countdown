class Link < ActiveRecord::Base
  validates :url, :format => URI::regexp(%w(http https))

  belongs_to :user
end
