struct Planet {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

extension Planet: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        rotationPeriod = try container.decode(String.self, forKey: .rotationPeriod)
        orbitalPeriod = try container.decode(String.self, forKey: .orbitalPeriod)
        diameter = try container.decode(String.self, forKey: .diameter)
        climate = try container.decode(String.self, forKey: .climate)
        gravity = try container.decode(String.self, forKey: .gravity)
        terrain = try container.decode(String.self, forKey: .terrain)
        surfaceWater = try container.decode(String.self, forKey: .surfaceWater)
        population = try container.decode(String.self, forKey: .population)
        residents = try container.decode([String].self, forKey: .residents)
        films = try container.decode([String].self, forKey: .films)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct PlanetsResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

extension PlanetsResults: Decodable {
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
        results = try container.decode([Planet].self, forKey: .results)
    }
}
