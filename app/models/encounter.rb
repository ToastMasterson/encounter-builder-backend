class Encounter < ApplicationRecord
    belongs_to :master
    has_many :monster_encounters
    has_many :monsters, through: :monster_encounters
end
