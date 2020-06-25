class Image < ApplicationRecord
  VALID_URL = %r{\A(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png|jpeg)\z}.freeze
  validates(:url, presence: true, format: { with: VALID_URL })
  acts_as_taggable
end
