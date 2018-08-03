//
//  RadioButtonsViewController.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 25/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit

class RadioButtonsViewController: UIViewController {

    @IBOutlet weak var radioButton1: DLRadioButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func GenderAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            print ("Male")
        } else {
            print("Female")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
