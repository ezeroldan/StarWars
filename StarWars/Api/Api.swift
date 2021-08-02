import Foundation
import Moya

private enum SWApi {
    case person(id: Int)
    case people(page: Int)

    case planet(id: Int)
    case planets(page: Int)

    case film(id: Int)
    case films(page: Int)

    case vehicle(id: Int)
    case vehicles(page: Int)

    case specie(id: Int)
    case species(page: Int)

    case starship(id: Int)
    case starships(page: Int)
}

extension SWApi: TargetType {
    var baseURL: URL { return URL(string: "https://swapi.dev/api")! }

    var path: String {
        switch self {
        case let .person(id):
            return "/people/\(id)"
        case .people:
            return "/people"

        case let .planet(id):
            return "/planets/\(id)"
        case .planets:
            return "/planets"

        case let .film(id):
            return "/films/\(id)"
        case .films:
            return "/films"

        case let .vehicle(id):
            return "/vehicles/\(id)"
        case .vehicles:
            return "/vehicles"

        case let .specie(id):
            return "/species/\(id)"
        case .species:
            return "/species"

        case let .starship(id):
            return "/starships/\(id)"
        case .starships:
            return "/starships"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .person, .planet, .film, .vehicle, .specie, .starship:
            return .requestPlain

        case let .people(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)

        case let .planets(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)

        case let .films(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)

        case let .vehicles(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)

        case let .species(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)

        case let .starships(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? { return ["Content-type": "application/json"] }
}

enum Api {
    private static var provider = MoyaProvider<SWApi>()

    public static func getPerson(id: Int, then: @escaping (Person) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Person.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getPeople(page: Int = 1, then: @escaping (PeopleResults) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(PeopleResults.self, from: response.data)
                    then(results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getPlanet(id: Int, then: @escaping (Planet) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Planet.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getPlanets(page: Int, then: @escaping ([Planet]) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(PlanetsResults.self, from: response.data)
                    then(results.results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getFilm(id: Int, then: @escaping (Film) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Film.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getFilms(page: Int, then: @escaping ([Film]) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(FilmsResults.self, from: response.data)
                    then(results.results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getVehicle(id: Int, then: @escaping (Vehicle) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Vehicle.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getVehicles(page: Int, then: @escaping ([Vehicle]) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(VehiclesResults.self, from: response.data)
                    then(results.results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getSpecie(id: Int, then: @escaping (Specie) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Specie.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getSpecies(page: Int, then: @escaping ([Specie]) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(SpeciesResults.self, from: response.data)
                    then(results.results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getStarship(id: Int, then: @escaping (Starship) -> Void) {
        provider.request(.person(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Starship.self, from: response.data)
                    then(result)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    public static func getStarships(page: Int, then: @escaping ([Starship]) -> Void) {
        provider.request(.people(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(StarshipsResults.self, from: response.data)
                    then(results.results)
                } catch let err {
                    print(err)
                }

            case let .failure(error):
                print(error)
            }
        }
    }
}
