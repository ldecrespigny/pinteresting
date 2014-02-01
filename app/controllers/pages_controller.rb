class PagesController < ApplicationController
  def home
  end

  def about
  end

  def team
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end


end
