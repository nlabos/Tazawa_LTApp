//
//  SoundPlayer.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    //音源の指定
    let music_data=NSDataAsset(name: "Wu")!.data
    
    var music_player:AVAudioPlayer!
    
    //音楽を再生
    func musicPlayer(){
        
        do{
            music_player=try AVAudioPlayer(data:music_data)
            music_player.play()
            
        }catch{
            print("エラー発生.音を流せません")
        }
    }
    
    //音楽を停止
    func stopAllMusic (){
        music_player?.stop()
    }
}
