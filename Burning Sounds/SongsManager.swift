//
//  SongsManager.swift
//  
//
//  Created by Eugen on 23/09/15.
//
//

import SwiftyJSON

class SongsManager {

    class var instance: SongsManager {
        struct Singleton {
            static let instance = SongsManager()
        }
        return Singleton.instance
    }

    // TODO: load from server
    let songs = [
        Song(stream: "https://api.soundcloud.com/tracks/40412857/stream",
        title: "Katy Perry - Wide Awake",
        coverImageUrl: "https://i1.sndcdn.com/artworks-000020270888-2y67l0-large.jpg")
    ]

    func allSongs() -> [Song]{
        let jsonData = loadJson()
        let json = JSON(data: jsonData!)
        print("got json: \(json)")
        return self.songs
    }

    func loadJson() -> NSData? {
        var data: NSData?
        let filePath = NSBundle.mainBundle().pathForResource("songs_pretty", ofType: "json")

        if let d = NSData(contentsOfFile: filePath!){
            data = d
        }
        return data
    }

}
