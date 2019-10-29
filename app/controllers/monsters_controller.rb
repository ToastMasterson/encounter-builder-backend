class MonstersController < ApplicationController

    def index
        @monsters = Monster.all
        render json: @monsters
    end

    def show
        @monster = Monster.find(id: params[:id])
    end

    def search
        party_size = params["party_size"].to_i
        party_level = params["party_level"].to_i
        handicap = 0.2
        party_challenge_rating = (party_size * handicap) + (party_level - 1)
        monster_alignment = params["monster_alignment"]
        monster_size = params["monster_size"]
        monster_difficulty = params["monster_difficulty"]
  
        challenge_result = Monster.all.select do |monster|
            if party_challenge_rating < 1
                party_challenge_rating = 1
                easy_diff = [0.0, 0.125, 0.25, 0.5]
            else
                party_challenge_rating = party_challenge_rating.round
                easy_diff = ((party_challenge_rating - 3)..(party_challenge_rating - 1)).to_a
            end
            med_diff = ((party_challenge_rating - 2)..(party_challenge_rating)).to_a
            hard_diff = ((party_challenge_rating - 1)..(party_challenge_rating + 1)).to_a
            chall_diff = ((party_challenge_rating)..(party_challenge_rating + 2)).to_a

            case monster_difficulty
            when "Easy"
                easy_diff.include?(monster.challenge_rating)
            when "Medium"
                med_diff.include?(monster.challenge_rating)
            when "Hard"
                hard_diff.include?(monster.challenge_rating)
            when "Challenging"
                chall_diff.include?(monster.challenge_rating)
            end
        end
        if monster_alignment == "Any"
            alignment_result = challenge_result
        else
            alignment_result = challenge_result.select{|monster| monster.alignment == monster_alignment}
        end
        if monster_size == "Any"
            size_result = alignment_result
        else
            size_result = alignment_result.select{|monster| monster.size == monster_size}
        end
        # byebug
        if size_result == []
            render json: {
                message: "No Results Found, Please Try Again"
            }
        else
            render json: size_result
        end
    end
end
