//
//  APIManager.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 19/10/23.
//

import Foundation

enum APIRequestError: Error {
    case badUrl, noData, invalidResponce,encodeError(Error),invalidData,decodeError(Error)
}

typealias Handler<T> = (Result<T, APIRequestError>) -> Void

//  MARK: - API Manager
final class APIManager
{
    static let shared = APIManager()
    private init() {}
    
    func request<T:Codable> (apiRouter:ApiEndPoints,
                             modelType:T.Type,
                             completion: @escaping Handler<T>)
    {
        
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.schema
        components.path = apiRouter.path
        components.queryItems = apiRouter.queryItems
        
       
        
        guard let url = components.url else {
            completion(.failure(.badUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.methode
       
        apiRouter.headers.forEach { (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let requestBody = apiRouter.body {
            do{
                let data = try JSONEncoder().encode(requestBody)
                urlRequest.httpBody = data
            }
            catch{
                completion(.failure(.encodeError(error)))
            }
            
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            
            guard let data = data , error == nil else {
                completion(.failure(.invalidData))
                return
            }
           
            guard let httpResponse = responce as? HTTPURLResponse,
                  httpResponse.statusCode == apiRouter.statusCode else {
                completion(.failure(.invalidResponce))
                return
            }
            
            do {
                let responce = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responce))
            } catch {
                print("Decoding Error in API Router : \(error)")
                completion(.failure(.decodeError(error)))
            }
            
        }.resume()
    }
    
}

