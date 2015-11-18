class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, :format => URI::regexp(%w(http https))

  belongs_to :user
end
