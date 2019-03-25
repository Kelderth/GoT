//
//  Episode.swift
//  GameOfThrones
//
//  Created by Eduardo Santiz on 3/25/19.
//  Copyright © 2019 EduardoSantiz. All rights reserved.
//

import Foundation

class Episode: Decodable {
    let name: String
    let season: Int
    let chapter: Int
    let airDate: String
    let airTime: String
    let summary: String
    let image: URL?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case season = "season"
        case chapter = "number"
        case airDate = "airdate"
        case airTime = "airtime"
        case summary = "summary"
        case image = "image"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.season = try container.decode(Int.self, forKey: .season)
        self.chapter = try container.decode(Int.self, forKey: .chapter)
        self.airDate = try container.decode(String.self, forKey: .airDate)
        self.airTime = try container.decode(String.self, forKey: .airTime)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.image = try container.decodeIfPresent(URL.self, forKey: .image) ?? nil
    }
    
}
