//
//  UIView+Extension.swift
//  driverphone
//
//  Created by Caijinglong on 2017/6/15.
//

import UIKit

extension UIView{
    
    @IBInspectable var radius:CGFloat {
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = radius > 0
        }
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set(newValue){
            layer.borderWidth = newValue
        }
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        set{
            layer.borderColor = newValue.cgColor
        }
        get{
            return UIColor.init(cgColor: layer.borderColor!)
        }
    }
    
    func loadViewFromNib(_ nibName:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    class func loadViewFromXib(_ xibName:String,_ anyClass:AnyClass) -> UIView {
        let bundle = Bundle(for: anyClass)
        let nib = UINib(nibName: xibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func getWidth() -> CGFloat{
        return self.frame.width
    }
    
    func getHeight()->CGFloat{
        return self.frame.height
    }
    
    func getX() -> CGFloat{
        return self.frame.x
    }
    
    func getY() -> CGFloat{
        return self.frame.y
    }
    
    var x:CGFloat{
        get{
            return getX()
        }
        
        set{
            self.frame.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return getY()
        }
        set{
            self.frame.y = newValue
        }
    }
    
    func moveToCenterWithY(toCenterView view:UIView){
        self.y = view.getHeight() / 2 - self.getHeight() / 2
    }
    
    func moveVerticalToSuperCenter(){
        if(superview != nil){
            moveToCenterWithY(toCenterView: superview!)
        }
        
    }
}
