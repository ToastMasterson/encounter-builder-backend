class EncountersController < ApplicationController

    def create
        @encounter = Encounter.create(title: params[:title], master_id: params[:master_id])
        render json: @encounter
    end

    def get_monsters
        @encounter = Encounter.find_by(id: params[:id])
        render json: {
            monsters: @encounter.monsters,
            encounter: @encounter
        }
    end

    def add_monster
        @encounter = Encounter.find_by(id: params[:encounterId])
        @monster = Monster.find_by(id: params[:monsterToAdd])
        @encounter.monsters << @monster
        render json: {
            message: "Success!",
            result: @encounter.monsters
        }
    end

    def remove_monster
        @encounter = Encounter.find_by(id: params[:encounterId])
        @encounter.monsters.delete(params[:monsterId])
        render json: {
            message: "Monster removed"
        }
    end

    def destroy
        @encounter = Encounter.find_by(id: params[:id])
        @encounter.destroy
    end
end
