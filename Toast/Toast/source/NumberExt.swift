//
//  IntExt.swift
//  driverphone
//
//  Created by Caijinglong on 2017/6/16.
//

import UIKit
extension Int{
    func toCGFloat()->CGFloat{
        return CGFloat(self)
    }
    
    func toFloat() -> Float{
        return Float(self)
    }
    
    func toString() -> String{
        return String(self)
    }
}

extension Float{
    func toCGFloat()->CGFloat{
        return CGFloat(self)
    }
}

extension CGFloat{
    func toInt() -> Int{
        return Int(self)
    }
    
    func toFloat() ->Float{
        return Float(self)
    }
}

extension Double{
    func toInt()->Int{
        return Int(self)
    }
}
