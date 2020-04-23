module Slugifiable
    module InstanceMethods
        def slug(name)
            name.gsub!(/[^0-9A-Za-z]/, " ")
            name.split(" ").join("-")
        end
    end

    module ClassMethods
        def find_by_slug(slugified_name)
            self.all.find do |i|
                i.slug == slugified_name
            end
        end
    end
end