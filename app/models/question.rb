class Question < ApplicationRecord
    validates :prompt, :style, :difficulty, :topic, presence: true
    validates :difficulty, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

    serialize :data, JSON

    has_one_attached :image

    def as_json(options={})
        json = super(only: [:id, :prompt, :answer, :difficulty, :topic, :fake_answers], root: true)

        json[:image_url] = Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?

        json
    end
end
