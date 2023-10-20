//
//  APIRouterProtocol.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 19/10/23.
//

import Foundation

protocol ApiEndPoints
{
    var host:        String { get }
    var schema:      String{ get}
    var path:        String {get}
    var methode:     String {get}
    var queryItems:  [URLQueryItem]{get}
    var headers:     [(String,String)]{get}
    var statusCode:  Int{get}
    var body:        Codable? {get}
}


