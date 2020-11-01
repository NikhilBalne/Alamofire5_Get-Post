//
//  TodoResponse.swift
//  Alamofire5_Get
//
//  Created by Nikhil Balne on 31/10/20.
//

import Foundation

struct TodoResponse: Decodable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
