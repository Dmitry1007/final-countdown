class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, :format => URI::regexp(%w(http https)), presence: true

  belongs_to :user
end
