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

    func allSongs() -> [Song]{
        //TODO: add caching
        let jsonData = loadJson()
        let json = JSON(data: jsonData!)

        var songs = [Song]()

        for (_, songObj):(String, JSON) in json {
            songs.append(mapSong(songObj))
        }
        return songs
    }

    func loadJson() -> NSData? {
        var data: NSData?
        let filePath = NSBundle.mainBundle().pathForResource("songs_pretty", ofType: "json")

        if let d = NSData(contentsOfFile: filePath!){
            data = d
        }
        return data
    }

    func mapSong(json: JSON) -> Song {
        return Song(stream: json["stream_url"].string!,
            title: json["title"].string!,
            coverImageUrl: json["artwork_url"].string
        )
    }

}
