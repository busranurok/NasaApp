//
//  RoverModel.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import Foundation

class RoverModel : Decodable, Identifiable {
    
    enum CodingKeys : String, CodingKey {
        
        case id = "id"
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
        
    }
    
    var id : Int
    var name : String
    var landingDate : String
    var launchDate : String
    var status : String
    
    required init(from decoder: Decoder) throws {
        
        do {
            
            let container = try decoder.container(keyedBy: RoverModel.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.landingDate = try container.decode(String.self, forKey: .landingDate)
            self.launchDate = try container.decode(String.self, forKey: .launchDate)
            self.status = try container.decode(String.self, forKey: .status)
            self.id = try container.decode(Int.self, forKey: .id)
            
        }
        catch {
            
            fatalError("Decode Başarısız")
            
        }
    }
}
