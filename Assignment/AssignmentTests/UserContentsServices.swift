//
//  UserContentsServices.swift
//  AssignmentTests
//
//  Created by Jaimini Chaturvedi on 16/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//

import Foundation
@testable import Assignment

class UserContentsServices: UserContentsServiceProtocol {
    var data: ContentFeedModel?
    func fetchFeeds(_ completion: @escaping ((Result<ContentFeedModel, ErrorResult>) -> Void)) {
        if let data = data {
            completion(Result.success(data))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No converter")))
        }
    }
}
