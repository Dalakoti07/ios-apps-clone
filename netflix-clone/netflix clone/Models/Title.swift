//
//  File.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import Foundation

struct TrendingTitleResponse: Codable{
    let results: [Title]
}

enum APIError: Error{
    case failedToGetData
}

struct Title: Codable{
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
