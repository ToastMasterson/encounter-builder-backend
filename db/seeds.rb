# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'pry'

Encounter.delete_all
Master.delete_all
Monster.delete_all

Master.create(username: "Toast")



open("https://dndmonstergenerator.firebaseio.com/.json") do |monsters|
    monsters.read.each_line do |monster|
        list = JSON.parse(monster)
        list.each do |monster|
            @item = monster
    
        # binding.pry
            object = {
            "index": @item["index"],
            "name": @item["name"],
            "size": @item["size"],
            "style": @item["type"],
            "subtype": @item["subtype"],
            "alignment": @item["alignment"],
            "armor_class": @item["armor_class"],
            "hit_points": @item["hit_points"],
            "hit_dice": @item["hit_dice"],
            "speed": @item["speed"],
            "strength": @item["strength"],
            "dexterity": @item["dexterity"],
            "constitution": @item["constitution"],
            "intelligence": @item["intelligence"],
            "wisdom": @item["wisdom"],
            "charisma": @item["charisma"],
            "constitution_save": @item["constitution_save"],
            "intelligence_save": @item["intelligence_save"],
            "wisdom_save": @item["wisdom_save"],
            "history": @item["history"],
            "perception": @item["perception"],
            "damage_vulnerabilities": @item["damage_vulnerabilities"],
            "damage_resistances": @item["damage_resistances"],
            "damage_immunities": @item["damage_immunities"],
            "condition_immunities": @item["condition_immunities"],
            "senses": @item["senses"],
            "languages": @item["languages"],
            "challenge_rating": @item["challenge_rating"],
            "special_abilities": @item["special_abilities"],
            "actions": @item["actions"],
            "legendary_actions": @item["legendary_actions"],
            "url": @item["url"],
        }
        # binding.pry
      Monster.create!(object)
    end
  end
end