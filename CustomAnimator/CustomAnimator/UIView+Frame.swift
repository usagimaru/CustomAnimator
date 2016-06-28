//
//  UIView+Frame.swift
//
//  Created by M.Satori on 16.03.07.
//  Copyright © 2016 usagimaru.
//

import UIKit

extension UIView {
	var origin: CGPoint {
		get {
			return self.frame.origin
		}
		set {
			var r = self.frame
			r.origin = newValue
			self.frame = r
		}
	}
	
	var x: CGFloat {
		get {
			return self.frame.origin.x
		}
		set {
			var r = self.frame
			r.origin.x = newValue
			self.frame = r
		}
	}
	
	var y: CGFloat {
		get {
			return self.frame.origin.y
		}
		set {
			var r = self.frame
			r.origin.y = newValue
			self.frame = r
		}
	}
	
	var size: CGSize {
		get {
			return self.frame.size
		}
		set {
			var r = self.frame
			r.size = newValue
			self.frame = r
		}
	}
	
	var width: CGFloat {
		get {
			return self.frame.size.width
		}
		set {
			var r = self.frame
			r.size.width = newValue
			self.frame = r
		}
	}
	
	var height: CGFloat {
		get {
			return self.frame.size.height
		}
		set {
			var r = self.frame
			r.size.height = newValue
			self.frame = r
		}
	}
	
}
