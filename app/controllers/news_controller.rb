class NewsController < ApplicationController
  include NytimesHelper

  def index
     @articles = NYTimes.retrieve_articles
  end

  def create
    article = NYTimes.retrieve_articles
    articles = []
    article.each do |subsection, section_articles|
        subsection  
      section_articles.each do |article|  
        articles.push(article[:title])  
        articles.push(article[:abstract])  
      end  
    end  

    News.create(user_id: current_user.id, title: articles[0], abstract: articles[1])
  end

  def show
  end

  def update
  end

  def destroy
  end
end
