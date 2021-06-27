//
//  NetworkingService.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import Foundation

class NetworkingService {
    
    private let applicationID = "5f8c2999"
    private let applicationKeys = "a76ef0d67f76f3c5b34175f74937ed87"
    
    func fetchData(product: String, completion: @escaping (Result<[Hit], Error>) -> Void) {
        
        //https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=5f8c2999&app_key=a76ef0d67f76f3c5b34175f74937ed87
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.edamam.com"
        components.path = "/api/recipes/v2"
        components.queryItems = [
            URLQueryItem(name: "type", value: "public"),
            URLQueryItem(name: "q", value: product),
            URLQueryItem(name: "app_id", value: applicationID),
            URLQueryItem(name: "app_key", value: applicationKeys),
            
        ]
        
        guard let url = components.url else { return }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(error!))
            }
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let food = try JSONDecoder().decode(Food.self, from: data)
                guard let hits = food.hits else { return }
                DispatchQueue.main.async {
                    completion(.success(hits))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}
