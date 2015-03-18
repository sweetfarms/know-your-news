module NytimesHelper
  
  class NYTimes
    @@url_base  = "http://api.nytimes.com/svc/news/v3/content/nyt/world.json?api-key="
    @@client_id = Rails.application.secrets.nytimes_top_id
    @@search_url_base = "http://query.nytimes.com/search/sitesearch/?action=click&contentCollection&region=TopBar&WT.nav=searchWidget&module=SearchSubmit&pgtype=Homepage#/"
    @@search_id = Rails.application.secrets.nytimes_search_id

    def self.retrieve_articles
      NYTimes.build_article_hash
    end

    def self.articles
      news  = HTTParty.get(@@url_base + @@client_id)
      media = news["results"]
    end

    def self.build_article_hash
      # first we build a hash where the keys will be the sections 
      articles = {}

      NYTimes.articles.each do |article|

        # the first time we have a new section, it won't be a key yet,
        # so, if the hashes key doesn't exit, create it and make it an
        # empty array
        if articles[article["subsection"]].nil?
          articles[article["subsection"]] = []
        end

        # then, push the article on to the existing sections' array
        articles[article["subsection"]].push({
          :title             => article["title"],
          :abstract          => article["abstract"],
          :link              => article["url"],
          :geographic_facet  => article["geo_facet"],
          :description_facet => article["des_facet"],
          # :relevant_articles => NYTimes.relevant_articles
        })
      end
      
      return articles
    end


    # def self.relevant_articles
    #     find = @@search_url_base + articles.[article["subsection"]]description_facet"][0].split.join('+') + articles.[article["subsection"]]geographic_facet"][0].split.join('+')
    # end

  end

end