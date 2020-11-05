//
//  ViewController.swift
//  TextInputFormatter
//
//  Created by venvehuob on 5/11/20.
//  Copyright © 2020 vermamukesh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtCard: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.tableFooterView = UIView.init()
    }
    @IBAction func printAllInputValues() {
        print("name = ", txtUserName.text ?? "")
        print("birthdate = ", txtBirthDate.text ?? "")
        print("card number = ", txtCard.text ?? "")
        print("mobile number  = ", txtMobileNumber.text ?? "")
    }
}
extension ViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        if textField == txtBirthDate {
            let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
            textField.text = lastText.format("nn/nn/nnnn", oldString: text)
            
        } else if textField == txtCard {
            let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
            textField.text = lastText.format("nnnn nnnn nnnn nnnn", oldString: text)
        } else if textField == txtMobileNumber {
            let format = "+nn nnnnnnnnnn"
            let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
            textField.text = lastText.format(format, oldString: text)
        } else if textField == txtUserName {
            let format = "xxxxxxxxxxxxxxx"
            let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
            textField.text = lastText.format(format, oldString: text)
        }
        return false
    }
}

