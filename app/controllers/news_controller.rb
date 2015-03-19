class NewsController < ApplicationController
  include NytimesHelper

  def index
     @articles = NYTimes.retrieve_articles
  end

  def create
    @news = News.new(user_id: current_user.id, title: params[:title], abstract: params[:abstract], article_url: params[:article_url])     
    respond_to do |format|
      if @news.save
        format.html  { redirect_to(@news,
                      :notice => 'Post was successfully created.') }
        format.json  { render :json => @news,
                      :status => :created, :location => @news }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @news.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  

  def show
    @news = News.find_by_id(current_user.id)
  end

  def update
  end

  def destroy
  end
end
