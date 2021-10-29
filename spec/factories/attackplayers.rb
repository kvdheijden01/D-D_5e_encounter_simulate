FactoryBot.define do
  factory :attackplayer do
    name { "Fist"}
    ability_mod { "STR" }
    dmg { 2.5 }
    ability_modifier_dmg { true }
  end
end
