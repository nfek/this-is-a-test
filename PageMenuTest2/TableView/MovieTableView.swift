//
//  MovieTableView.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 20/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit


protocol MovieTableViewDelegate  {
    func toggleSection(header: MovieTableView, section: Int)
}

class MovieTableView: UITableViewHeaderFooterView {
    var delegate : MovieTableViewDelegate?
    var section : Int!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (selectMovieTableView)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (selectMovieTableView)))
    }
    
    func selectMovieTableView (gesture : UITapGestureRecognizer){
        let cell = gesture.view as! MovieTableView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, subTitle: String, section: Int, delegate: MovieTableViewDelegate){
        self.titleLabel.text = title
        self.subLabel.text = subTitle
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel? .textColor = UIColor.white
        self.subLabel?.textColor = UIColor.white
        self.subLabel?.alpha = 0.7
        self.contentView.backgroundColor = UIColor.darkGray
    }
  
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
