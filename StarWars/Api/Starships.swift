struct Starship {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

extension Starship: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case starshipClass = "starship_class"
        case pilots
        case films
        case created
        case edited
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        model = try container.decode(String.self, forKey: .model)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        costInCredits = try container.decode(String.self, forKey: .costInCredits)
        length = try container.decode(String.self, forKey: .length)
        maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        crew = try container.decode(String.self, forKey: .crew)
        passengers = try container.decode(String.self, forKey: .passengers)
        cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        consumables = try container.decode(String.self, forKey: .consumables)
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        MGLT = try container.decode(String.self, forKey: .url)
        starshipClass = try container.decode(String.self, forKey: .starshipClass)
        pilots = try container.decode([String].self, forKey: .pilots)
        films = try container.decode([String].self, forKey: .films)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct StarshipsResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

extension StarshipsResults: Decodable {
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
        results = try container.decode([Starship].self, forKey: .results)
    }
}
