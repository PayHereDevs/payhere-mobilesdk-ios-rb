//
//  Extention.swift
//  sdk
//
//  Created by Kamal Sampath Upasena on 3/6/18.
//  Copyright © 2018 PayHere. All rights reserved.
//

import Foundation


//extension String {
//
//    var md5: String? {
//        guard let data = self.data(using: String.Encoding.utf8) else { return nil }
//
//        let hash = data.withUnsafeBytes { (bytes: UnsafePointer<Data>) -> [UInt8] in
//            var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
//            CC_MD5(bytes, CC_LONG(data.count), &hash)
//            return hash
//        }

//       return  MD5(self)

//        return hash.map { String(format: "%02x", $0) }.joined()
//    }
    
    
//}

extension Bundle{
    
    internal static var payHereBundle: Bundle{
        if let debugBundle = Bundle(identifier: "lk.payahere.payHereSDK"){
            return debugBundle
        }
        else if let prodBundleURL = Bundle.main.url(forResource: "payHereSDK", withExtension: "bundle"){
            // payHereSDK is built through spec.resource_bundles
            if let prodBundle = Bundle(url: prodBundleURL){
                return prodBundle
            }
        }
        print("🟡 PayHere iOS Crash: Could not find the PayHere Resource Bundle in the App Binary.")
        print("")
        print("Reason: The file, 'payHereSDK.bundle' was not statically linked into your App Binary.")
        print("Troubleshooting: Please check the following.")
        print("\t1. Make sure that in your Podfile you have removed the 'use_frameworks!' line.")
        print("\t2. Run the `pod install` comamnd in the Xcode project directory.")
        print("\t3. If other build errors occur when you comment out use_frameworks!, then you probably want the Original iOS SDK and not this Resource Bundle (RE) Edition.")
        print("")
        print("Original iOS SDK: https://github.com/PayHereLK/payhere-mobilesdk-ios")
        print("")
        fatalError("PayHere Bundle could not be found!")
    }
    
}
