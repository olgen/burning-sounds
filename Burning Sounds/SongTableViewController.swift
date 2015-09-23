//
//  SongTableViewController.swift
//  Burning Sounds
//
//  Created by Eugen on 22/09/15.
//  Copyright © 2015 olgen. All rights reserved.
//

import UIKit
import Haneke

class SongTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func songs() ->[Song] {
        return SongsManager.instance.allSongs()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs().count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath) as! SongTableViewCell
        let song = self.songs()[indexPath.row]
        cell.titleLabel.text = song.title
        if let urlString = song.coverImageUrl {
            let url = NSURL(string: urlString)
            cell.songImageView.hnk_setImageFromURL(url!)
        }
        return cell
    }
}
