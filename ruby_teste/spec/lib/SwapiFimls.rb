class SwapiFimls

include HTTParty
base_uri "https://swapi.dev/api/"

    def self.get_all_films
        get("/films")
    end
    
    def self.get_film_by_id(id)
        get("/films/#{id}")
    end

    def self.get_film_by_title(title)
        get("/films/?search=#{title}")
    end

    def self.get_api_root
        get("")
    end

end