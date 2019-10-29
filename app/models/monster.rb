class Monster < ApplicationRecord
    has_many :monster_encounters
    has_many :encounters, through: :monster_encounters
end
