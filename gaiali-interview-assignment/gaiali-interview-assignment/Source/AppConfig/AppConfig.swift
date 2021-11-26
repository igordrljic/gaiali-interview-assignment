//
//  AppConfig.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

class AppConfig: Decodable {
    static let shared = AppConfig.read()
    static let environment = Environment.read()
    
    let weatherForecastBaseURL: URL
    let weatherApiKey: String
    
    private enum CodingKeys: String, CodingKey {
        case weatherForecastBaseURL = "WeatherForecastBaseURL"
        case weatherApiKey = "WeatherApiKey"
    }
    
    static func read(for environment: Environment = environment) -> Self {
        do {
            let configFileName = "\(String(describing: Self.self))-\(environment.rawValue)"
            guard let configFilePath = Bundle(for: Self.self).path(forResource: configFileName, ofType: "plist"),
                  let data = FileManager.default.contents(atPath: configFilePath)
            else {
                throw AppConfigError.readingConfigFailed(for: configFileName)
            }
            return try PropertyListDecoder().decode(Self.self, from: data)
        } catch {
            fatalError(String(describing: error))
        }
    }
}
