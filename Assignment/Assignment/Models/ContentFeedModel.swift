//
//  ContentFeedModel.swift
//  Assignment
//
//  Created by Jaimini Chaturvedi on 15/08/20.
//  Copyright © 2020 Jaimini Chaturvedi. All rights reserved.
//

import Foundation

struct ContentFeedModel: Decodable {
    //MARK: Properties
    let title: String?
    let rows: [UserContentsModel]?
}

