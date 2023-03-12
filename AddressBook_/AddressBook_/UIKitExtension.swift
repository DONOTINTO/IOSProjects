//
//  UIKitExtension.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/12.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, dismissPresentingView: Bool = false ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .cancel) { _ in
            if dismissPresentingView {
                self.presentingViewController?.dismiss(animated: true)
            }
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
