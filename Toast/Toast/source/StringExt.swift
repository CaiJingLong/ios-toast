//
//  StringExt.swift
//  Toast
//
//  Created by Caijinglong on 2017/7/7.
//

import UIKit

extension String{
    func sizeWithFont(_ font:UIFont!) ->CGSize {
        
        let attrs:[String:Any] = [NSFontAttributeName:font]
        
        let string:NSString = self as NSString
        
        return string.size(attributes: attrs )
        
    }
}
