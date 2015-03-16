//
//  DonateViewController.swift
//  samahope
//
//  Created by Isaac Ho on 3/15/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit
import PassKit
class DonateViewController: UIViewController, UITextFieldDelegate {
    var selectedAmount: Int?
    var treatment: Treatment?

    @IBOutlet weak var fullAmountLabel: UILabel!
    @IBOutlet weak var completeAmountLabel: UILabel!
    @IBOutlet weak var halfAmountLabel: UILabel!
    @IBOutlet weak var customTextField: UITextField!
    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var completeView: UIView!
    
    @IBOutlet weak var halfView: UIView!
    
    @IBOutlet weak var fullView: UIView!
    let SupportedPaymentNetworks = [PKPaymentNetworkVisa, PKPaymentNetworkMasterCard, PKPaymentNetworkAmex]
    let ApplePaySwagMerchantID = "merchant.com.codepath.SamaHope" // Fill in your merchant ID here!
    
    var highlightColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)

    @IBAction func onHalfTap(sender: AnyObject) {
        selectedAmount = treatment!.cost! / 2
        unHighlightAll()
        halfView.backgroundColor = highlightColor
        
    }
    
    @IBAction func onFullTap(sender: AnyObject) {
        selectedAmount = treatment!.cost!
        unHighlightAll()
        fullView.backgroundColor = highlightColor
        
    }
    @IBAction func onCompleteTap(sender: AnyObject) {
        selectedAmount = treatment!.amountNeeded!
        unHighlightAll()
        completeView.backgroundColor = highlightColor
    }
    func unHighlightAll()
    {
        var c = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        customView.backgroundColor = c
        completeView.backgroundColor = c
        halfView.backgroundColor = c
        fullView.backgroundColor = c
    }
    @IBAction func onCustomEdit(sender: AnyObject) {
        var textField = sender as UITextField
    
        selectedAmount = textField.text.toInt()
        
          }
    
    @IBAction func onTap(sender: AnyObject) {
        customTextField.resignFirstResponder()
      
    }
    
    @IBAction func onCustomEditStart(sender: AnyObject) {
        customTextField.text = ""
        unHighlightAll()
        customView.backgroundColor = highlightColor
    }
    @IBAction func onPay(sender: AnyObject) {
        let request = PKPaymentRequest()
        request.merchantIdentifier = ApplePaySwagMerchantID
        request.supportedNetworks = SupportedPaymentNetworks
        request.merchantCapabilities = PKMerchantCapability.Capability3DS
        request.countryCode = "US"
        request.currencyCode = "USD"
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "SamaHope", amount: NSDecimalNumber(integer:selectedAmount!) )
        ]
        
        let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
        applePayController.delegate = self

        self.presentViewController(applePayController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        treatment = Treatment()
        selectedAmount = Int(0)
        // Do any additional setup after loading the view.
        println( "DonateVC: viewDidLoad")
        customTextField.keyboardType = UIKeyboardType.NumberPad
        customTextField.returnKeyType = UIReturnKeyType.Done
        customTextField.delegate = self
        unHighlightAll()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DonateViewController: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController!, didAuthorizePayment payment: PKPayment!, completion: ((PKPaymentAuthorizationStatus) -> Void)!) {
        completion(PKPaymentAuthorizationStatus.Success)
    }
    
    func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

