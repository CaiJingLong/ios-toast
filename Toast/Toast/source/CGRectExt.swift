//
//  CGRectExt.swift
//  driverphone
//
//  Created by Caijinglong on 2017/6/19.
//

import UIKit
extension CGRect{
    
    var center:CGPoint
    {
        get{
            let centerX = self.x + self.width/2
            let centerY = self.y + self.height/2
            return CGPoint(x: centerX, y: centerY)
        }
        
        set{
            self.x = newValue.x - self.width / 2
            self.y = newValue.y - self.height / 2
        }
    }
    
    var x:CGFloat{
        get{
            return self.origin.x
        }
        
        set{
            self.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.origin.y
        }
        
        set{
            return self.origin.y = newValue
        }
    }
}
