//
//  OpportunityView.swift
//  NasaApp
//
//  Created by BusranurOK on 10.07.2022.
//

import SwiftUI

struct OpportunityView: View {
    
    @ObservedObject var opportunityViewModel =  OpportunityViewModel()
    @State var size = CameraModel.CameraName.FHAZ.rawValue
    @State var show : Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Menu(content: {
                    
                    ForEach(CameraModel.CameraName.allCases, id: \.self) { cameraName in
                        
                        Button(action: {
                            
                            size = cameraName.rawValue
                            
                            if cameraName == CameraModel.CameraName.ALL{
                                opportunityViewModel.photoList = opportunityViewModel.allPhotos
                            }
                            else {
                                opportunityViewModel.photoList = opportunityViewModel.allPhotos.filter{ $0.camera.name == cameraName.rawValue}
                            }
                   
                            opportunityViewModel.filterCameraName = cameraName.rawValue
                            
                        }) {
                            
                            Text(cameraName.rawValue)
                            
                        }
                        
                    }
                    
                }) {
                    
                    Label(title: {
                        
                        Text(size)
                            .foregroundColor(.white)
                        
                    }) {
                        
                        Image(systemName: "video.circle.fill")
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color("Tertiary5"))
                    .clipShape(Capsule())
                    
                }
            }
            
            ZStack {
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(opportunityViewModel, id: \.self.id) { (photo : PhotoModel) in
                            
                            AsyncImage(url: URL(string: photo.imageUrl)) { image in
                                
                                image.resizable()
                                
                            }
                        placeholder:{
                            Color.red
                        }
                        .frame(width: 128, height: 128)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .listRowSeparator(.hidden, edges: .top)
                        .onTapGesture {
                            
                            show.toggle()
                            opportunityViewModel.selectedId = photo.id
                            
                        }
                        .onAppear {
                            
                            self.opportunityViewModel.fetchMorePhotos(currentItem: photo)
                            
                          }
                            
                        }
                    }
                }
                
                if show {
                    
                    let filteredPhoto = opportunityViewModel.photoList.filter{ $0.id == opportunityViewModel.selectedId}
                    
                    PhotoDetailView(show: $show,selectedPhoto: filteredPhoto.first!)
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        
    }
    
}
