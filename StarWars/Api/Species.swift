struct Specie {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let homeworld: String
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

extension Specie: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case created
        case edited
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        classification = try container.decode(String.self, forKey: .classification)
        designation = try container.decode(String.self, forKey: .designation)
        averageHeight = try container.decode(String.self, forKey: .averageHeight)
        skinColors = try container.decode(String.self, forKey: .skinColors)
        hairColors = try container.decode(String.self, forKey: .hairColors)
        eyeColors = try container.decode(String.self, forKey: .eyeColors)
        averageLifespan = try container.decode(String.self, forKey: .averageLifespan)
        homeworld = try container.decode(String.self, forKey: .homeworld)
        language = try container.decode(String.self, forKey: .language)
        people = try container.decode([String].self, forKey: .people)
        films = try container.decode([String].self, forKey: .films)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct SpeciesResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}

extension SpeciesResults: Decodable {
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
        results = try container.decode([Specie].self, forKey: .results)
    }
}
