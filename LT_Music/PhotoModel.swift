//
//  PhotoModel.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//


import Foundation

var photoArray:[PhotoModel] = makePhotoData()

// データモデルの更新
struct PhotoModel: Identifiable {
    var id: Int
    var photoName: String
    var photoImageName: String // 画像ファイル名用のプロパティ
}

func makePhotoData() -> [PhotoModel] {
    var dataArray: [PhotoModel] = []
    
    // 画像ファイル名を追加
    dataArray.append(PhotoModel(id: 1, photoName: "C.R.E.A.M. - Wu Tang Clan", photoImageName: "C.R.E.A.M.- Wu Tang Clan"))
    dataArray.append(PhotoModel(id: 2, photoName: "Award Tour", photoImageName: "Award Tour"))
    dataArray.append(PhotoModel(id: 3, photoName: "New York State of Mind", photoImageName: "New York State of Mind"))
    dataArray.append(PhotoModel(id: 4, photoName: "All Caps", photoImageName: "All Caps"))
    dataArray.append(PhotoModel(id: 5, photoName: "Shook Ones Pt.II - Mobb Deep", photoImageName: "Shook Ones Pt. II - Mobb Deep"))
    return dataArray
}



class ViewModel: ObservableObject {
    @Published var selectedPhoto: PhotoModel?
}

