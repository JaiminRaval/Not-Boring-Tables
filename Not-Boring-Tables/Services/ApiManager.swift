//
//  ApiManager.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 22/09/25.
//

import Foundation


final class ApiManager {
    //    MARK: - native api call function
    public static let shared = ApiManager()
    let urlstr = "https://official-joke-api.appspot.com/jokes/random/25"
    
    func fetchJokes(completion: @escaping(Result<[JokeModel],Error>)-> Void) {
    
        if let url = URL(string: urlstr) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                guard let jokeData = data else { return }
                do {
                    let jsonData = try JSONDecoder().decode([JokeModel].self, from: jokeData)
                    completion(.success(jsonData))
                    debugPrint(jsonData)
                } catch(let err) {
                    completion(.failure(err))
                    debugPrint("error in decoding")
                }
            }
            dataTask.resume()
        }
    }
    
}




//  Another API: https://api.restful-api.dev/objects
//      Data JSON: {"id":"1","name":"Google Pixel 6 Pro","data":{"color":"Cloudy White","capacity":"128 GB"}}
