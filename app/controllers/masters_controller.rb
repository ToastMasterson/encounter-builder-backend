class MastersController < ApplicationController
    def index
        @masters = Master.all
    end

    def create
        @master = Master.create(username: params[:username])
    end

    def log_in

        @master = Master.find_by(username: params[:username])
        if !@master
            @master = Master.create(username: params[:username])
            @tempEncounter = Encounter.create(title: "New Encounter", user_id: @master.id)
        end

        @encounters = @master.encounters

        @monsters = []

        @encounters.each{|e| @monsters << e.monsters}

        render json: {
            master: @master,
            encounters: @encounters,
            monsters: @monsters
        }
    end
end
