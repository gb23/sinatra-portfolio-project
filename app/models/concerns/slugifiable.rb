module Slugifiable
    module InstanceMethods
        def slug 
   
            if self.instance_of? User
                self.username.downcase.gsub(/[^\s\w]/,"").gsub(/\s/, "-")
            elsif self.instance_of? Item
                self.name.downcase.gsub(/[^\s\w]/,"").gsub(/\s/, "-") + "_fridge" + self.fridge.id.to_s
            end 
        end

        def select_by_slug(slug)
            self.all.select{ |instance| instance.slug == slug }
        end
    end

    module ClassMethods
        def select_by_slug(slug)
            self.all.select{ |instance| instance.slug == slug }
        end
    end
end