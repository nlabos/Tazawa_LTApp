//
//  SoundPlayer.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//

import UIKit
import AVFoundation

// SoundPlayer の更新
class SoundPlayer: NSObject {
    var music_player: AVAudioPlayer!
    
    // 音楽ファイル名を引数として受け取る
    func playMusic(fileName: String) {
        // 音源の指定
        guard let musicData = NSDataAsset(name: fileName)?.data else {
            print("音楽ファイルが見つかりません")
            return
        }
        
        do {
            music_player = try AVAudioPlayer(data: musicData)
            music_player.play()
        } catch {
            print("エラー発生: 音を流せません")
        }
    }
    
    //音楽を停止
    func stopAllMusic() {
        music_player?.stop()
    }
}
