//
//  Serie.swift
//  GameOfThrones
//
//  Created by Eduardo Santiz on 3/25/19.
//  Copyright © 2019 EduardoSantiz. All rights reserved.
//

import Foundation

struct Serie: Decodable {
    let title: String
    let language: String
    let status: String
    let premiered: String
    let officialSite: URL
    let summary: String
    let episodes: [Episode]?
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case language = "language"
        case status = "status"
        case premiered = "premiered"
        case officialSite = "officialSite"
        case summary = "summary"
        case episodes = "episodes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.language = try container.decode(String.self, forKey: .language)
        self.status = try container.decode(String.self, forKey: .status)
        self.premiered = try container.decode(String.self, forKey: .premiered)
        self.officialSite = try container.decode(URL.self, forKey: .officialSite)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.episodes = try container.decodeIfPresent([Episode].self, forKey: .episodes) ?? []
    }
    
}
