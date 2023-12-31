//
//  APIRouter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 19/10/23.
//

import Foundation

protocol APIRouter {
    var host: String { get }
    var schema: String { get }
    var path: String { get }
    var methode: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [(String, String)] { get }
    var statusCode: Int { get }
    var body: Codable? { get }
}

enum APIRequestError: Error {
    case badUrl, noData, invalidResponce, encodeError(Error), invalidData, decodeError(Error)
}

typealias Handler<T> = (Result<T, APIRequestError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func request<T: Codable> (apiRouter: APIRouter,
                              modelType: T.Type,
                              completion: @escaping Handler<T>) {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.schema
        components.path = apiRouter.path
        components.queryItems = apiRouter.queryItems
        
        guard let apiUrl = components.url else {
            completion(.failure(.badUrl))
            return
        }
        var urlRequest = URLRequest(url: apiUrl)
        urlRequest.httpMethod = apiRouter.methode
        
        apiRouter.headers.forEach { (headerKey, headerValue) in
            urlRequest.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        
        if let requestBody = apiRouter.body {
            do {
                let data = try JSONEncoder().encode(requestBody)
                urlRequest.httpBody = data
            } catch {
                completion(.failure(.encodeError(error)))
            }
            
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            
            guard let data = data, error == nil else {
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
