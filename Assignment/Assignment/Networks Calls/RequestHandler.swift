//
//  RequestHandler.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 16/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//

import Foundation

class RequestHandler {
    func networkResult<T: Parsing>(completion: @escaping ((Result<[T], ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            return { dataResult in
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParsingHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: Constants.Messages.NetworkErrorMessage + error.localizedDescription)))
                        break
                    }
                })
            }
    }

    func networkResult<T: Parsing>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            return { dataResult in
                print(dataResult)
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParsingHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: Constants.Messages.NetworkErrorMessage + error.localizedDescription)))
                        break
                    }
                })
            }
    }
}

