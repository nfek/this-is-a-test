 //
//  MovieTableViewController.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 23/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewDelegate{

     @IBOutlet weak var tableView: UITableView!
    
    var sections = [
        MovieSection(genre: "🦁 Animation",
                     movies: ["The Lion King", "The Incredibles"],
                     expanded: false,
                     subtitle: "Please select a movie"),
        MovieSection(genre: "💥 Superhero",
                     movies: ["Guardians of the Galaxy", "The Avengers", "The Flash", "The Dark Knight"],
                     expanded: false,
                     subtitle: "Please select a movie"),
        MovieSection(genre: "👻 Horror",
                     movies: ["The Walking Dead", "Insidious", "Conjuring"],
                     expanded: false,
                     subtitle: "Please select a movie")
    ]
    
    var selectIndexPath : IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        selectIndexPath = IndexPath (row: -1, section: -1)
        let nib = UINib(nibName: "MovieTableView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "movieTableView")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    func tableView(_ tableView:UITableView, heightForHeaderInSection section:Int) -> CGFloat{
        return 58
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded){
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "movieTableView") as! MovieTableView
        headerView.customInit(title: sections[section].genre, subTitle: sections[section].subtitle, section: section, delegate: self)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")
        cell?.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        cell?.accessoryType = (indexPath == selectIndexPath) ? .checkmark:.none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndexPath = indexPath
        self.sections[indexPath.section].subtitle = tableView.cellForRow(at: indexPath)?.textLabel?.text
        sections[indexPath.section].expanded = !sections[indexPath.section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([indexPath.section], with: .automatic)
        tableView.endUpdates()
    }
    
    func toggleSection(header: MovieTableView, section: Int){
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .automatic)
        tableView.endUpdates()

        
//        sections[section].expanded = !sections[section].expanded
//
//
//        tableView.beginUpdates()
//        for i in 0 ..< sections[section].movies.count {
//            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
//        }
//        tableView.endUpdates()
        
    }
}
