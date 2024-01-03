//
//  ExtractingData.swift
//  SpaceX Project
//
//  Created by Anton Landersdorfer on 21.12.19.
//  Copyright © 2019 Anton Landersdorfer. All rights reserved.
//

import Foundation

extension DetailViewController {
    
        internal func extractData() {
            var id: String {
                return String(detailRocket.id)
            }
            
            var active: String {
                return detailRocket.active ? "Yes" : "No"
            }
                        
            var stages: String {
                return String(detailRocket.stages)
            }
            
            var boosters: String {
                return String(detailRocket.boosters)
            }
            
            var costPerLaunch: String {
                return "\(detailRocket.costPerLaunch)$"
            }
            
            var successRatePCT: String {
                return "\(detailRocket.successRatePCT)%"
            }
            
            let firstflight = detailRocket.firstFlight
            
            let country = detailRocket.country
            
            let company = detailRocket.company
            
            var height: String {
                let computedData = "\(detailRocket.height.feet) Feet, \(detailRocket.height.meters) Meters"
                return computedData
            }
            
            var diameter: String {
                let computedData = "\(detailRocket.diameter.feet) Feet, \(detailRocket.diameter.meters) Meters"
                return computedData
            }
            
            var mass: String {
                let computedData = "\(detailRocket.mass.lb) LB, \(detailRocket.mass.kg) KG"
                return computedData
            }
            
    //        var payloadWeights: String {
    //            for weight in detailRocket.payloadWeights {
    //                return ""
    //            }
    //        }
            
            var firstStage: String {
                let reusable: String = detailRocket.firstStage.reusable ? "Is Reusable\n" : "Is Not Reusable\n"
                
                var engines: String {
                    return "Engines: \(detailRocket.firstStage.engines)\n"
                }
                
                var fuelAmountTons: String {
                    return "Fuel Amount in Tons: \(detailRocket.firstStage.fuelAmountTons)\n"
                }
                
                var burnTimeSec: String {
                    var burnTime = String()
                    if let computedBurnTime = detailRocket.firstStage.burnTimeSec {
                        burnTime = String(computedBurnTime)
                    }
                    return "Burn Time in Secs: \(burnTime)\n"
                }
                
                var thrustSeaLevel: String {
                    let computedData = "Thrust Sea Level: \(detailRocket.firstStage.thrustSeaLevel.kN) kN, \(detailRocket.firstStage.thrustSeaLevel.lbf) lbf\n"
                    return computedData
                }
                
                var thrustVacuum: String {
                    let computedData = "Thrust Vacuum: \(detailRocket.firstStage.thrustVacuum.kN) kN, \(detailRocket.firstStage.thrustVacuum.lbf) lbfs\n"
                    return computedData
                }
                
                return "\(reusable) \(engines)\(fuelAmountTons)\(burnTimeSec)\(thrustSeaLevel)\(thrustVacuum)"
            }
            
            let description = detailRocket.description
            
            let rocketID = detailRocket.rocketID
            
            let rocketName = detailRocket.rocketName
            
            let rocketType = detailRocket.rocketType
            
            
            
            let detailedData = [id, active, stages, boosters, costPerLaunch, successRatePCT, firstflight, country, company, height, diameter, mass, firstStage, description, rocketID, rocketName, rocketType]
            
            details = detailedData
            
            detailTableView.reloadData()
        }
}
