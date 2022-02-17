class Bookmark < ApplicationRecord
  belongs_to :book, :list
end
