//
//  Song.swift
//  Burning Sounds
//
//  Created by Eugen on 22/09/15.
//  Copyright © 2015 olgen. All rights reserved.
//

import UIKit

class Song: NSObject {

    var streamUrl: String
    var title: String
    var coverImageUrl: String?

    init(stream: String, title: String, coverImageUrl: String?) {
        self.streamUrl = stream
        self.title = title
        self.coverImageUrl = coverImageUrl
    }

}