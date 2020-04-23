class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

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