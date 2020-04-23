# require_relative 'concerns/slugifiable.rb'

class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    # include Slugifiable

    def slug
        name.gsub!(/[^0-9A-Za-z]/, " ")
        name.split(" ").join("-")
    end

    def self.find_by_slug(slugified_name)
        self.all.find do |i|
            i.slug == slugified_name
        end
    end
end