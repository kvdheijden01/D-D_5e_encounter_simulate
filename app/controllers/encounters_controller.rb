class EncountersController < ApplicationController
  def index
    @encounters = Encounter.first
  end

  def start
    @encounters = Encounter.new
  end
end
