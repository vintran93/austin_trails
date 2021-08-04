class AustinTrails::Hike

    attr_accessor :name, :description, :intro, :heading # Set the attributes for the Hike class

    def self.trail
        self.scrape_details
    end

    def self.scrape_details
        details = []
        
        details << self.scrape_intro
        details << self.scrape_mayfield
        details << self.scrape_river_place
        details << self.scrape_wild_basin
        details << self.scrape_mount_bonnell
        details << self.scrape_green_belt
        details << self.scrape_turkey_creek
        details << self.scrape_mckinney_falls
        details << self.scrape_river_place
        details << self.scrape_mary_moore
        details << self.scrape_ann_and_roy
    end

    def self.scrape_intro
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/best-hikes-in-austin"))
        hike = self.new # create a new instance of hike 
        hike.heading = doc.search("div#content p").text 
        hike.intro = doc.search("div.xs-mx3.md-mx0.xs-my5.xs-line-height-6.feature-intro p").text.strip
        hike # return the instance intro and heading and store it into the array
    end

    def self.scrape_mayfield
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/mayfield-nature-preserve"))
        hike = self.new # create a new instance of hike 
        hike.name = doc.search("div h1").text.strip
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike # return the instance name and description and store it into the array
    end

    def self.scrape_river_place
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/river-place-nature-trail"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_wild_basin
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/wild-basin-wilderness-preserve"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_mount_bonnell
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/mount-bonnell"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_blunn_creek
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/blunn-creek-preserve"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_green_belt
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/barton-creek-greenbelt"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip + "\n" + "\n" + 
        hike.description = doc.search("tbody").text.gsub(/\s+/, " ").strip
        hike
    end

    def self.scrape_turkey_creek
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/turkey-creek-trail"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_mckinney_falls
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/mckinney-falls-state-park"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_mary_moore
        doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/mary-moore-searight-park"))
        hike = self.new
        hike.name = doc.search("div h1").text
        hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip
        hike
    end

    def self.scrape_ann_and_roy
       doc = Nokogiri::HTML(open("https://www.timeout.com/austin/things-to-do/ann-and-roy-butler-hike-and-bike-trail"))
       hike = self.new
       hike.name = doc.search("div h1").text
       hike.description = doc.search("//div[@itemprop = 'reviewBody']").children.text.strip + "\n" + "\n" + 
       hike.description = doc.search("tbody").text.gsub(/\s+/, " ").strip
       hike
       #binding.pry
    end
end