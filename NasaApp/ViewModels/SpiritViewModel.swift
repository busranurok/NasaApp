//
//  SpiritViewModel.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import Foundation
import Alamofire

class SpiritViewModel: ObservableObject  {
    
    @Published var photoList = [PhotoModel]()
    @Published var selectedId: Int?
    @Published var selectedPhoto : PhotoModel?
  
    
    var startIndex : Int { photoList.startIndex }
    var endIndex: Int { photoList.endIndex }
    var nextPageIndex = 1
    var currentlyLoading : Bool = false
    var allPhotos = [PhotoModel]()
    var filterCameraName : String = ""
    
    init() {
        
        fetchMorePhotos()
        
    }
}

extension SpiritViewModel: RandomAccessCollection {
    
    subscript(position: Int) -> PhotoModel {
        
        return photoList[position]
        
    }
}

extension SpiritViewModel : InfiniteScrollable {
    
    func fetchMorePhotos(currentItem : PhotoModel? = nil) {
        
        if !shouldLoadMoredata(currentItem: currentItem) {
            
            return
            
        }
        
        currentlyLoading = true
        
        let url = "\(ApplicationConstants.spiritURLString)\(nextPageIndex)"
        let request = AF.request(url)
        request.responseDecodable(of: ResponseModel.self){(response) in
            
            DispatchQueue.main.async {
                
                if response.value != nil {
                    
                    for photo in response.value!.photos {
                        
                        self.allPhotos.append(photo)
                        
                    }
                    
                    self.photoList = self.allPhotos
                }
                
                self.nextPageIndex += 1
                
            }
            
            self.currentlyLoading = false
            
        }
    }
    
    func shouldLoadMoredata(currentItem : PhotoModel? = nil) -> Bool {
        
        if currentlyLoading {
            
            return false
            
        }
        
        guard let currentItem = currentItem else {
            
            return true
            
        }
        
        guard let lastItem = photoList.last else {
            
            return true
            
        }
        
        if filterCameraName != "" {
            
            return false
            
        }
        
        return currentItem.id == lastItem.id
        
    }
}
