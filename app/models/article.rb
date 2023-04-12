class Article < ApplicationRecord
    # validates :title, presence: true
    # validates :body, presence: true, length: { minimum: 10 }

    has_one_attached :avatar
    has_many_attached :posters
end
