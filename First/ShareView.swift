//
//  ShareView.swift
//  First
//
//  Created by Fatih Sağlam on 19.11.2022.
//

import UIKit

class ShareView: UIView {
    var shareAction: (String) -> Void
    var textField: UITextField!

    init(shareAction: @escaping (String) -> Void) {
        self.shareAction = shareAction
        super.init(frame: .zero)

        let textField = UITextField()
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        addSubview(textField)

        let button = UIButton(type: .system)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        addSubview(textField)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported.")
    }

    @objc func shareTapped() {
        guard let text = textField.text else {
            return
        }

        shareAction(text)
    }
}
