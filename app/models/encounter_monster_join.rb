class EncounterMonsterJoin < ApplicationRecord
    belongs_to :encounter
    belongs_to :monster
end
