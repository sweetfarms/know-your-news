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
                      :notice => 'Article saved!') }
        format.json  { render :json => @news,
                      :status => :created, :location => @news }
      else
        format.html  { redirect_to(@news,
                      :notice => 'You have already saved that article.')
                     }
        format.json  { render :json => @news.errors,
                      :status => :unprocessable_entity }
      end
    end

  end
  

  def show
    @news = User.find_by_id(current_user.id).news
    #display in reverse chronological order
    @news = @news.order('created_at DESC')
  end

  def update
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to action: :show
  end
end
