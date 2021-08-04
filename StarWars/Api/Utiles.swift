import Foundation

func getIntFromUrl(url: String) -> Int {
    if url != "" {
        let url = url.split(separator: "/")
        let last = String(url[url.count - 1])
        if let id = Int(last) {
            return id
        } else {
            return 0
        }
    }
    return 0
}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}

func getQueryStringParameterInt(url: String, param: String) -> Int {
    let newURL = URL(string: url)!
    if let value = newURL.valueOf(param) {
        if let id = Int(value) {
            return id
        }
    }
    return 0
}
