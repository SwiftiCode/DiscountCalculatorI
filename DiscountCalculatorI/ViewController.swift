//
//  ViewController.swift
//  DiscountCalculatorI
//
//  Created by SwiftiCode on 21/6/20.
//  Copyright © 2020 SwiftiCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Properties
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var discountPickerView: UIPickerView!
    @IBOutlet weak var discountAmountLabel: UILabel!
    @IBOutlet weak var discountTotalLabel: UILabel!
    
    var inputAmount = 0.0
    var pickerData = [Int]()
    
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        discountTextField.delegate = self
        discountPickerView.delegate = self
        discountPickerView.dataSource = self
        
        preparePickerData()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        inputAmount = Double(textField.text!) ?? 0.0
        pickerView(discountPickerView, didSelectRow: discountPickerView.selectedRow(inComponent: 0), inComponent: 0)
        
    }
    
    // MARK: UIPickerViewDataSource
    func preparePickerData() {
        
        pickerData += [2]
        pickerData += [3]
        var i = 5
        while i <= 95 {
            pickerData += [i]
            i += 5
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])+"%"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var percentDiscount: Double = 0.0
        
        discountTextField.resignFirstResponder()
        
        percentDiscount = Double(pickerData[row])/100
        
        let discAmt = inputAmount * percentDiscount
        let totalAmt = inputAmount - discAmt
        
        discountAmountLabel.text = String(format: "Discount Amount = $%.2f", discAmt)
        discountTotalLabel.text = String(format: "After Discount = $%.2f", totalAmt)
        
    }

    // MARK: IBAction
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        
        discountTextField.resignFirstResponder()
    }
    
}

