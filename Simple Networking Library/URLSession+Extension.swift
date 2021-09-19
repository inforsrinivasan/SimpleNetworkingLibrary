import Foundation

public extension URLSession {
    func load<A>(_ resource: Resource<A>,
                 completion: @escaping (A?) -> ()) {
        dataTask(with: resource.urlRequest) { data, _, _ in
            completion(data.flatMap(resource.parse))
        }.resume()
    }
}
