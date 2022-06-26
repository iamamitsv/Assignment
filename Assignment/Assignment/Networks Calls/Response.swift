//
//  Response.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 15/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//

import Foundation
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

