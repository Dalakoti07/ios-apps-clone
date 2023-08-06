//
//  ApiCaller.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import Foundation

struct Constants{
    static let apiKey = "5fe067e52253dbc3de67b0dbba1654c1"
    static let baseUrl = "https://api.themoviedb.org"
}

class APICaller{
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/all/day?api_key=\(Constants.apiKey)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                // print(results.results[0])
                completion(.success(results.results))
            }catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
