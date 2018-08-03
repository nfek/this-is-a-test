//
//  PickerView.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 26/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit

class PickerView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var textfieldBizCat: UITextField!
    @IBOutlet var pickerBizCat: UIPickerView! = UIPickerView()
    
    var bizCat = ["Cat One", "Cat Two", "Cat Three"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pickerBizCat.isHidden = true;
        textfieldBizCat.text = bizCat[0]
//        textfieldBizCat.inputView = pickerBizCat
    }
    
//    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return bizCat.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return bizCat[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        textfieldBizCat.text = bizCat[row]
        pickerBizCat.isHidden = true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerBizCat.isHidden = false
        return false
    }


}
