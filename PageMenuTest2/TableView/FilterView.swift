//
//  FilterView.swift
//  PageMenuTest2
//
//  Created by Emyl Khairuddin on 25/07/2018.
//  Copyright © 2018 Emyl Khairuddin. All rights reserved.
//

import UIKit

class FilterView: UITableViewHeaderFooterView, UIPickerViewDelegate, UIPickerViewDataSource{

  
    @IBOutlet weak var radioButtonStatus: DLRadioButton!
    
    @IBOutlet weak var favoriteDayTextField: UITextField!
    @IBOutlet weak internal var startDateTextField: UITextField!
    @IBOutlet weak internal var EndDateTextField: UITextField!
    
    var selectedDay: String?
    var savedDate: String?
    
    let days = ["MC Fees",
                "Water",
                "Electricity",
                "Parking"]
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
//        pickerBizCat.isHidden = true;
//        textfieldBizCat.text = bizCat[0]

        createDayPicker()
        createDatePicker()
        createToolbar()
        
        //self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (selectMovieTableView)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        pickerBizCat.isHidden = true;
//        textfieldBizCat.text = bizCat[0]
        //self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (selectMovieTableView)))
    }
    
    //radio button
    @IBAction func StatusAction(_ sender: DLRadioButton) {
        if sender.tag == 1
        {
            print("Status All")
        }
        else if sender.tag == 2{
            print("Status Paid")
        }
        else {
            print("Status Unpaid")
        }
    }

    
    //picker starts
    func createDayPicker() {
        
        let dayPicker = UIPickerView()
        dayPicker.delegate = self as? UIPickerViewDelegate
        
        favoriteDayTextField.inputView = dayPicker
        
        //Customizations
        dayPicker.backgroundColor = .black
    }
    
    func createDatePicker() {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        //change date format for datepicker
         datePicker.locale = NSLocale.init(localeIdentifier: "en_GB") as Locale
        datePicker.addTarget(self, action: #selector(Picker.dateChanged(datePicker:)), for: .valueChanged)
        
        startDateTextField.inputView = datePicker
        EndDateTextField.inputView = datePicker
        
        //Customizations
        datePicker.backgroundColor = .white
    }
    
    func dateChanged(datePicker: UIDatePicker){
        print("date changed")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        savedDate = dateFormatter.string(from: datePicker.date)
        //        startDateTextField.text = dateFormatter.string(from: datePicker.date)
        //        EndDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func startDateSelected(_ sender: Any) {
        startDateTextField.text = savedDate
    }
    
    @IBAction func endDateSelected(_ sender: Any) {
        EndDateTextField.text = savedDate
    }
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Picker.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        favoriteDayTextField.inputAccessoryView = toolBar
        startDateTextField.inputAccessoryView = toolBar
        EndDateTextField.inputAccessoryView = toolBar
    }
    
    
//    func dismissKeyboard() {
//        view.endEditing(true)
//    } //picker ends
    
    //picker extension starts
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedDay = days[row]
        favoriteDayTextField.text = selectedDay
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = days[row]
        
        return label
    } //picker extension ends
}
extension UIApplication {
    /// Dismiss keyboard from key window.
    open static func endEditing(_ force: Bool = false) {
        shared.keyWindow?.endEditing(force)
    }
}



