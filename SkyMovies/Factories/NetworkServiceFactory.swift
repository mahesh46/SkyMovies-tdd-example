//
//  NetworkServiceFactory.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import Foundation

class NetworkServiceFactory {
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if environment == "TEST" {
            return MockWebservice()
        } else {
            return Webservice()
        }
    }
}
