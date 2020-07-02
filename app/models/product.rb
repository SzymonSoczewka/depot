class Product < ApplicationRecord#::Migration[6.0]
    validates :title, :description, :image_url, presence: true
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
    }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    def change
        create_table :products do |t|
        t.string :title
        t.text :description
        t.string :image_url
        t.decimal :price, precision: 8, scale: 2
        t.timestamps
        end
    end
end
