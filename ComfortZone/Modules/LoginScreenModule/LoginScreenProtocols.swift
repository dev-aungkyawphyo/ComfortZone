//
//  LoginScreenProtocols.swift
//  ComfortZone
//
//  Created by Aung Kyaw Phyo on 27/07/2024.
//

import Foundation

protocol LoginScreenProtocols: AnyObject {
    func showTextFieldErrorLabel(error: ValidationErrors)
    func clickedOnLoginButtonAction(inputData: LoginRequestModel)
    func baseRouter()
}
