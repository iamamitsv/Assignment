//
//  RequestService.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 16/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//


import Foundation

final class RequestService {
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: Constants.Messages.WrongURLFormat)))
            return nil
        }
        let request = RequestFactory.request(method: .GET, url: url)
//        if let reachability = Reachability(), !reachability.isReachable {
//            request.cachePolicy = .returnCacheDataDontLoad
//        }
        let task = session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(.network(string: Constants.Messages.RequestErrorMessage + error.localizedDescription)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}

final class RequestFactory {
    enum Method: String {
        case GET, POST, PUT, DELETE, PATCH
    }

    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
