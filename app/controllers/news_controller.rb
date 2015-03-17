class NewsController < ApplicationController
  include NytimesHelper

  def index
     @articles = NYTimes.retrieve_articles
     @relevant_search = NYTimes.relevant_articles
  end

  def create
  end
  
  def show
  end

  def update
  end

  def destroy
  end
end
