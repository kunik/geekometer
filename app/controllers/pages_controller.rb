class PagesController < ApplicationController
  before_filter :authenticate_user!

  def welcome
  end

  def profile
  end
end
