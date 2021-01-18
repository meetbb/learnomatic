//
//  AlertUtils.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 18/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import SCLAlertView

class AlertUtils {
    
    class func showSuccessAlert(message: String) {
        SCLAlertView().showSuccess("Success", subTitle: message)
    }
}
