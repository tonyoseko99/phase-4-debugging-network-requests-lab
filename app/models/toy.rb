class Toy < ApplicationRecord
    # validatations
    validates :name, presence: true
    validates :image, presence: true
end
