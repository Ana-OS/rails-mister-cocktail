class UserController < ApplicationController
  def profile;end
  def cocktails
    @dose = Dose.new
  end
  def reviews;end
end
