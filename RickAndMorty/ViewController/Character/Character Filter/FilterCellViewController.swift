//
//  FilterCell.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 09/08/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {


    var textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var checkboxImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "empty_checkbox"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    var arrowIndicator: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow"))
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(checkboxImageView)
        contentView.addSubview(textView)
        contentView.addSubview(arrowIndicator)

        textView.addSubview(titleLabel)
        textView.addSubview(subtitleLabel)

        buildArrowConstraints()
        buildTextViewConstraints()
        buildCheckboxConstraints()
        buildTitleConstraints()
        buildSubtitleConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not available")
    }

    func setup(title: String, subtitle: String? = nil, isSelected: Bool = false, showIndicator: Bool = false) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        self.isSelected = isSelected
        checkboxImageView.image = isSelected ? UIImage(named: "") : UIImage(named: "empty_checkbox")
        arrowIndicator.isHidden = !showIndicator
    }


    // MARK: Create constraints
    func buildArrowConstraints() {
        let constraints = [arrowIndicator.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                           arrowIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)]

        NSLayoutConstraint.activate(constraints)
    }

    func buildTextViewConstraints() {
        let constraints = [textView.leftAnchor.constraint(equalTo: checkboxImageView.rightAnchor, constant: 13),
                           textView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                           textView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 32)]

        NSLayoutConstraint.activate(constraints)
    }

    func buildTitleConstraints() {
        let constraints = [titleLabel.topAnchor.constraint(equalTo: textView.topAnchor),
                           titleLabel.leftAnchor.constraint(equalTo: textView.leftAnchor),
                           titleLabel.rightAnchor.constraint(equalTo: textView.rightAnchor),
                           titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor)]

        NSLayoutConstraint.activate(constraints)
    }

    func buildSubtitleConstraints() {
        let constraints = [subtitleLabel.leftAnchor.constraint(equalTo: textView.leftAnchor),
                           subtitleLabel.rightAnchor.constraint(equalTo: textView.rightAnchor),
                           subtitleLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor)]

        NSLayoutConstraint.activate(constraints)
    }

    func buildCheckboxConstraints() {
        let constraints = [checkboxImageView.widthAnchor.constraint(equalToConstant: 28),
                           checkboxImageView.heightAnchor.constraint(equalToConstant: 30),
                           checkboxImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                           checkboxImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)]

        NSLayoutConstraint.activate(constraints)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        checkboxImageView.image = selected ? UIImage(named: "selected_checkbox") : UIImage(named: "empty_checkbox")
    }
}
