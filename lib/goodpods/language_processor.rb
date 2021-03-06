module LanguageProcessor

  class Bio

    def initialize options
      @podcast = options.podcast
      @bio     = options.podcast.try(:bio)
    end

    def entities
      @bio.split_by_words.map do |word|
        word if is_entity?(word)
      end
    end

    def like_podcast
      entities.map do |entity|
       Podcast.where("podcasts.bio contains ?", entity).all
      end.flatten
    end

    private
    def split_by_words(str)
      str.split("")
    end

    def is_entity?(word)
      WikipediaClient::Checker.is_entity?(word)
    end
  end

  # TODO: Refactor eventually to include
  # class ParseText
  #   def initialize str
  #   end
  # end
end
