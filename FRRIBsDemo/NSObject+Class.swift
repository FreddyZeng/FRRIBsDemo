//
//  UIViewController+Print.swift
//  FRRIBsDemo
//
//  Created by fanrong on 2018/4/20.
//  Copyright © 2018年 fanrong. All rights reserved.
//

import Foundation

extension NSObject {
     public func getClassName() -> String {
        return String(describing: self.classForCoder)
    }
}
