//
//  HeaderView.swift
//  CustomAnimator
//
//  Created by M.Satori on 16.06.28.
//  Copyright © 2016年 usagimaru. All rights reserved.
//

import UIKit

class HeaderView: UIView {
	
	weak var target: AnyObject?
	var action: Selector?
	
	class func fromNib() -> HeaderView {
		return UINib(nibName: "HeaderView", bundle: nil).instantiateWithOwner(self, options: nil).first as! HeaderView
	}
	
	@IBAction func buttonAction(sender: AnyObject) {
		if let action = action {
			target?.performSelector(action, withObject: self)
		}
	}

}
