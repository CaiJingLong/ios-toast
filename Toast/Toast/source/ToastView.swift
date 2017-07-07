//
//  ToastView.swift
//  Toast
//
//  Created by Caijinglong on 2017/7/7.
//

import UIKit

class ToastView:UIView{
    
    @IBOutlet weak var content: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func newToastView()->ToastView{
        return UIView.loadViewFromXib("ToastView", ToastView.classForCoder()) as! ToastView
    }
    
}
