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
    var musicFileName: String 
}

func makePhotoData() -> [PhotoModel] {
    var dataArray: [PhotoModel] = []
    
    // 画像ファイル名を追加
    dataArray.append(PhotoModel(id: 1, photoName: "C.R.E.A.M. - Wu Tang Clan", photoImageName: "C.R.E.A.M.- Wu Tang Clan", musicFileName: "Wu"))
    dataArray.append(PhotoModel(id: 2, photoName: "Award Tour", photoImageName: "Award Tour", musicFileName: "AwardTour"))
    dataArray.append(PhotoModel(id: 3, photoName: "New York State of Mind", photoImageName: "New York State of Mind", musicFileName: "NYSoM"))
    dataArray.append(PhotoModel(id: 4, photoName: "All Caps", photoImageName: "All Caps", musicFileName: "AllCaps"))
    dataArray.append(PhotoModel(id: 5, photoName: "Shook Ones Pt.II - Mobb Deep", photoImageName: "Shook Ones Pt. II - Mobb Deep", musicFileName: "Shook1s"))
    return dataArray
}



class ViewModel: ObservableObject {
    @Published var selectedPhoto: PhotoModel?
    private var photoIndex = 0
    
    var selectedMusicFileName: String? {
        selectedPhoto?.musicFileName
    }
    
    func playNext() {
            photoIndex += 1
            if photoIndex >= photoArray.count {
                photoIndex = 0
            }
            selectedPhoto = photoArray[photoIndex]
        }

        // 前の曲を再生
        func playPrevious() {
            photoIndex -= 1
            if photoIndex < 0 {
                photoIndex = photoArray.count - 1
            }
            selectedPhoto = photoArray[photoIndex]
        }
}

