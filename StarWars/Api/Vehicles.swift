struct Vehicle {
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
    let vehicleClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

extension Vehicle: Decodable {
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
        case vehicleClass = "vehicle_class"
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
        costInCredits = try container.decode(String.self, forKey: .model)
        length = try container.decode(String.self, forKey: .length)
        maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        crew = try container.decode(String.self, forKey: .crew)
        passengers = try container.decode(String.self, forKey: .passengers)
        cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        consumables = try container.decode(String.self, forKey: .consumables)
        vehicleClass = try container.decode(String.self, forKey: .vehicleClass)
        pilots = try container.decode([String].self, forKey: .pilots)
        films = try container.decode([String].self, forKey: .films)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct VehiclesResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}

extension VehiclesResults: Decodable {
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
        results = try container.decode([Vehicle].self, forKey: .results)
    }
}
