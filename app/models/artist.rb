# require_relative '../concerns/slugifiable'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

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