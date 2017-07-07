//
//  ToastView.swift
//  driverphone
//
//  Created by Caijinglong on 2017/6/19.
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

extension UIView{
    class func loadViewFromXib(_ xibName:String,_ anyClass:AnyClass) -> UIView {
        let bundle = Bundle(for: anyClass)
        let nib = UINib(nibName: xibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

class Toast{
    
    static var window:UIWindow?
    static var toastView:ToastView?
    
    class func initToast(){
        let windows = UIApplication.shared.windows
        NSLog("%i",windows.count)
        Toast.window = (UIApplication.shared.windows.last)
    }
    
    class func toast(_ msg:String,length:Int = 3){
        if(Toast.toastView != nil){
            let toast = Toast.toastView
            toast?.removeFromSuperview()
            toast?.layer.removeAllAnimations()
        }
        
        
        let rect:CGRect = UIScreen.main.bounds

        Toast.toastView = ToastView.newToastView()
        
        let toast = Toast.toastView
        
        var width:Int
        var height:Int
        //        let count = msg.count()
        
        //        let nsMsg:NSString = NSString(string: msg)
        let size = msg.sizeWithFont(UIFont.systemFont(ofSize: 17))
        
        if(size.width >= 200){
            width = 200
            height = 80
            toast?.content.numberOfLines = 2
        }else{
            width = size.width.toInt() + 20
            height = 40
            toast?.content.numberOfLines = 1
        }
        
        if(size.width >= 400){
            height = 120
            toast?.content.numberOfLines = 3
        }
        
        let x = rect.center.x - width.toCGFloat() / 2
        let y = rect.height - height.toCGFloat() - 100
        
        toast?.frame = CGRect(x: x, y: y, width: width.toCGFloat(), height: height.toCGFloat())
        
        toast?.content?.text = msg
        //        toast?.content?.textColor = .red
        NSLog("%@",toast?.content ?? "toast.content is null")
        
        if(!(toast?.isHidden)!){
            toast?.layer.removeAllAnimations()
        }
        
        if(toast?.superview != nil){
            toast?.removeFromSuperview()
        }
        
        let window = UIApplication.shared.windows.last
        
        window?.addSubview(toast!)
        window?.bringSubview(toFront: toast!)
        toast?.alpha = 1
        toast?.isHidden = false
        
        UIView.animate(withDuration: 2, delay: 1, options: .allowAnimatedContent, animations: {
            toast?.alpha = 0
        }) { (Bool) in
            toast?.isHidden = true
            toast?.removeFromSuperview()
            return
        }
    }
}

func toast(_ msg:String,length:Int = 3){
    Toast.toast(msg)
}
