struct Film {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

extension Film: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        episodeId = try container.decode(Int.self, forKey: .episodeId)
        openingCrawl = try container.decode(String.self, forKey: .openingCrawl)
        director = try container.decode(String.self, forKey: .director)
        producer = try container.decode(String.self, forKey: .producer)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        characters = try container.decode([String].self, forKey: .characters)
        planets = try container.decode([String].self, forKey: .planets)
        starships = try container.decode([String].self, forKey: .starships)
        vehicles = try container.decode([String].self, forKey: .vehicles)
        species = try container.decode([String].self, forKey: .species)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct FilmsResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]
}

extension FilmsResults: Decodable {
    private enum ResultsCodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        next = try container.decode(String?.self, forKey: .next)
        previous = try container.decode(String?.self, forKey: .previous)
        results = try container.decode([Film].self, forKey: .results)
    }
}
