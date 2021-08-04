struct Person: Identifiable {
    var id: Int {
        getIntFromUrl(url: url)
    }

    var name: String = ""
    var height: String = ""
    var mass: String = ""
    var hairColor: String = ""
    var skinColor: String = ""
    var eyeColor: String = ""
    var birthYear: String = ""
    var gender: String = ""
    var homeworld: String = ""
    var films: [String] = []
    var species: [String] = []
    var vehicles: [String] = []
    var starships: [String] = []
    var created: String = ""
    var edited: String = ""
    var url: String = ""
}

extension Person: Decodable {
    private enum ResultCodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        height = try container.decode(String.self, forKey: .height)
        mass = try container.decode(String.self, forKey: .mass)
        hairColor = try container.decode(String.self, forKey: .hairColor)
        skinColor = try container.decode(String.self, forKey: .skinColor)
        eyeColor = try container.decode(String.self, forKey: .eyeColor)
        birthYear = try container.decode(String.self, forKey: .birthYear)
        gender = try container.decode(String.self, forKey: .gender)
        homeworld = try container.decode(String.self, forKey: .homeworld)
        films = try container.decode([String].self, forKey: .films)
        species = try container.decode([String].self, forKey: .species)
        vehicles = try container.decode([String].self, forKey: .vehicles)
        starships = try container.decode([String].self, forKey: .starships)
        created = try container.decode(String.self, forKey: .created)
        edited = try container.decode(String.self, forKey: .edited)
        url = try container.decode(String.self, forKey: .url)
    }
}

struct PeopleResults {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
    var nextPage: Int {
        if let url = next {
            return getQueryStringParameterInt(url: url, param: "page")
        }
        return 0
    }
}

extension PeopleResults: Decodable {
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
        results = try container.decode([Person].self, forKey: .results)
    }
}
