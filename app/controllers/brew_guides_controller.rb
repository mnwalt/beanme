class BrewGuidesController < ApplicationController

  def chemex
    @ounces = params[:ounces_of_coffee].to_i
    @grams_of_water = (@ounces * 33.5764).round(0)
    @grams_of_coffee = (@ounces * 2.1042).round(0)
    @brew_mins = (@ounces * 0.2896).round(0)

    render("chemex.html.erb")
  end

  def v60
    @ounces = params[:ounces_of_coffee].to_i
    @grams_of_water = (@ounces * 33.5764).round(0)
    @grams_of_coffee = (@ounces * 2.1042).round(0)
    @brew_mins = (@ounces * 0.2118).round(0)

    render("v60.html.erb")
  end

  def french_press
    @ounces = params[:ounces_of_coffee].to_i
    @grams_of_water = (@ounces * 33.5764).round(0)
    @grams_of_coffee = (@ounces * 2.1042).round(0)
    @brew_mins = 5

    render("french_press.html.erb")
  end
end
