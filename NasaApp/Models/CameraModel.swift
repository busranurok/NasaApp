//
//  CameraModel.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import Foundation
import SwiftUI

class CameraModel : Decodable, Identifiable {
    
    enum CodingKeys : String, CodingKey {
        
        case id = "id"
        case name = "name"
        case roverId = "rover_id"
        case fullName = "full_name"
        
    }
    
    var id : Int
    var name : String
    var roverId : Int
    var fullName : String
    
    enum CameraName : String, CaseIterable {
        
        case ALL = ""
        case FHAZ = "FHAZ"
        case RHAZ = "RHAZ"
        case MAST = "MAST"
        case CHEMCAM = "CHEMCAM"
        case MAHLI = "MAHLI"
        case MARDI = "MARDI"
        case NAVCAM = "NAVCAM"
        case PANCAM = "PANCAM"
        case MINITES = "MINITES"
        
    }
    
    required init(from decoder: Decoder) throws {
        
        do {
            
            let container = try decoder.container(keyedBy: CameraModel.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.roverId = try container.decode(Int.self, forKey: .roverId)
            self.fullName = try container.decode(String.self, forKey: .fullName)
            self.id = try container.decode(Int.self, forKey: .id)
            
        }
        catch {
            
            fatalError("Decode Başarısız")
            
        }
    }
}
