class MonsterEncounter < ApplicationRecord
  belongs_to :monster
  belongs_to :encounter
end
