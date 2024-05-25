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
    var musicFileName : String
}

func makePhotoData() -> [PhotoModel] {
    var dataArray: [PhotoModel] = []
    
    // 画像ファイル名を追加
    dataArray.append(PhotoModel(id: 1, photoName: "C.R.E.A.M. - Wu Tang Clan", photoImageName: "C.R.E.A.M.- Wu Tang Clan", musicFileName: "Wu"))
    dataArray.append(PhotoModel(id: 2, photoName: "Award Tour", photoImageName: "Award Tour", musicFileName: "Wu"))
    dataArray.append(PhotoModel(id: 3, photoName: "New York State of Mind", photoImageName: "New York State of Mind", musicFileName: "Wu"))
    dataArray.append(PhotoModel(id: 4, photoName: "All Caps", photoImageName: "All Caps", musicFileName: "Wu"))
    dataArray.append(PhotoModel(id: 5, photoName: "Shook Ones Pt.II - Mobb Deep", photoImageName: "Shook Ones Pt. II - Mobb Deep", musicFileName: "Wu"))
    return dataArray
}



class ViewModel: ObservableObject {
    @Published var selectedPhoto: PhotoModel?
    @Published var photoArray: [PhotoModel] = makePhotoData()
    var currentIndex: Int = 0

    // 次の曲に進む
    func moveToNextTrack() {
        if currentIndex < photoArray.count - 1 {
            currentIndex += 1
            selectedPhoto = photoArray[currentIndex]
        } else {
            // リストの最後に達した場合、最初に戻るか、停止する
            currentIndex = 0
            selectedPhoto = photoArray[currentIndex]
        }
    }

    // 前の曲に戻る
    func moveToPreviousTrack() {
        if currentIndex > 0 {
            currentIndex -= 1
            selectedPhoto = photoArray[currentIndex]
        } else {
            // リストの最初の場合、最後の曲に進むか、停止する
            currentIndex = photoArray.count - 1
            selectedPhoto = photoArray[currentIndex]
        }
    }
}
