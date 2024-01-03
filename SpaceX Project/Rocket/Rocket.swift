//
//  Rocket.swift
//  SpaceX-Rockets
//
//  Created by Anton Landersdorfer on 19.10.19.
//  Copyright © 2019 Anton Landersdorfer. All rights reserved.
//

import Foundation

struct Rocket: Codable {
    let id: Int
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePCT: Int
    let firstFlight: String
    let country: String
    let company: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeights]
    let firstStage: FirstStage
    
    
//    let flickrImages: [FlickrImage]
    let description: String
    let rocketID: String
    let rocketName: String
    let rocketType: String

    private enum CodingKeys: String, CodingKey {
        case id
        case active
        case stages
        case boosters
        case costPerLaunch = "costPerLaunch"
        case successRatePCT = "successRatePct"
        case firstFlight = "firstFlight"
        case country
        case company
        case height
        case diameter
        case mass
        case payloadWeights = "payloadWeights"
        case firstStage = "firstStage"

        
        
//        case flickrImages = "flickrImages"
        case description
        case rocketID = "rocketId"
        case rocketName = "rocketName"
        case rocketType = "rocketType"
    }
}

struct Height: Codable {
    let meters: Float
    let feet: Float
}

struct Diameter: Codable {
    let meters: Float
    let feet: Float
}

struct Mass: Codable {
    let kg: Float
    let lb: Float
}

struct PayloadWeights: Codable {
    let id: String
    let name: String
    let kg: Float
    let lb: Float
}


struct FirstStage: Codable {
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Float
    let burnTimeSec: Float?
    let thrustSeaLevel: ThrustSeaLevel
    let thrustVacuum: ThrustVacuum
    
    private enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case fuelAmountTons = "fuelAmountTons"
        case burnTimeSec = "burnTimeSec"
        case thrustSeaLevel = "thrustSeaLevel"
        case thrustVacuum = "thrustVacuum"
    }
}

    struct ThrustSeaLevel: Codable {
        let kN: Float
        let lbf: Float
    }

    struct ThrustVacuum: Codable {
        let kN: Float
        let lbf: Float
    }


struct SecondStage: Codable {
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Float
    let burnTimeSec: Float
    let thrust: Thrust
}

    struct Thrust: Codable {
        let kN: Float
        let lbf: Float
    }


struct FlickrImage: Codable {
    let flickrImage: String
}
