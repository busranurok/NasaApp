//
//  PhotoModel.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import Foundation

class PhotoModel : Decodable, Identifiable {
    
    var id : Int
    var sol : Int
    var camera : CameraModel
    var imageUrl : String
    var earthDate : String
    var rover : RoverModel
    
    enum CodingKeys : String, CodingKey {
        
        case id = "id"
        case sol = "sol"
        case camera = "camera"
        case imageUrl = "img_src"
        case earthDate = "earth_date"
        case rover = "rover"
        
    }
    
    required init(from decoder: Decoder) {
        
        do {
            
            let container = try decoder.container(keyedBy: PhotoModel.CodingKeys.self)
            self.sol = try container.decode(Int.self, forKey: .sol)
            self.camera = try container.decode(CameraModel.self, forKey: .camera)
            var url = try container.decode(String.self, forKey: .imageUrl)
            url = url.replacingOccurrences(of:"http:" , with: "https:")
            self.imageUrl = url
            self.earthDate = try container.decode(String.self, forKey: .earthDate)
            self.rover = try container.decode(RoverModel.self, forKey: .rover)
            self.id = try container.decode(Int.self, forKey: .id)
            
        }
        catch {
            
            fatalError("Decode Başarısız")
            
        }
    }
}
