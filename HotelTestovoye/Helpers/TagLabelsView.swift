//
//  TagListView.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 12.09.2023.
//

import UIKit
//
//final class TagLabelsView: UIView {
//
//    // MARK: - Public
//    var tagNames: [String] = [] {
//        didSet {
//
//        }
//    }
//    let tagHeight: CGFloat = 30
//    let tagPaddingX: CGFloat = 16
//    let tagSpacingX: CGFloat = 8
//    let tagSpacingY: CGFloat = 8
//    var intrinsicContentHeight: CGFloat = 0
//
//    // MARK: - Constructor
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: -
//    func commonInit() {
//        // Initialization code, if any
//    }
//
//
//
//}
//
class TagLabelView: UIView {

    var tagNames: [String] = [] {
        didSet {
            addTagLabels()
        }
    }

    let tagHeight:CGFloat = 30
    let tagPaddingX: CGFloat = 20
    let tagSpacingX: CGFloat = 8
    let tagSpacingY: CGFloat = 8

    var intrinsicHeight: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() -> Void {
    }

    func addTagLabels() -> Void {

        // if we already have tag labels (or buttons, etc)
        //  remove any excess (e.g. we had 10 tags, new set is only 7)
        while self.subviews.count > tagNames.count {
            self.subviews[0].removeFromSuperview()
        }

        // if we don't have enough labels, create and add as needed
        while self.subviews.count < tagNames.count {

            // create a new label
            let label = UILabel()

            // set its properties (title, colors, corners, etc)
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5
            label.font = .sfpdM16
            label.textColor = .secondGrayText
            label.backgroundColor = .cyan
            addSubview(label)
        }

        // now loop through labels and set text and size
        for (str, v) in zip(tagNames, self.subviews) {
            guard let label = v as? UILabel else {
                fatalError("non-UILabel subview found!")
            }
            label.text = str
            label.frame.size.width = label.intrinsicContentSize.width + tagPaddingX
            label.frame.size.height = tagHeight
        }

    }

    func displayTagLabels() {

        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0

        // for each label in the array
        self.subviews.forEach { v in

            guard let label = v as? UILabel else {
                fatalError("non-UILabel subview found!")
            }

            // if current X + label width will be greater than container view width
            //  "move to next row"
            if currentOriginX + label.frame.width > bounds.width {
                currentOriginX = 0
                currentOriginY += tagHeight + tagSpacingY
            }

            // set the btn frame origin
            label.frame.origin.x = currentOriginX
            label.frame.origin.y = currentOriginY

            // increment current X by btn width + spacing
            currentOriginX += label.frame.width + tagSpacingX

        }

        // update intrinsic height
        intrinsicHeight = currentOriginY + tagHeight
        invalidateIntrinsicContentSize()
    }

    // allow this view to set its own intrinsic height
    override var intrinsicContentSize: CGSize {
        var sz = super.intrinsicContentSize
        sz.height = intrinsicHeight
        return sz
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        displayTagLabels()
    }

}

//import UIKit
//
//final class TagLabelsView: UIView {
//
//    // MARK: - Public
//    var tagNames: [String] = [] {
//        didSet {
//            updateTagLabels()
//        }
//    }
//
//    // MARK: - Private
//    private var intrinsicHeight: CGFloat = 0
//    private let tagHeight: CGFloat = 30
//    private let tagPaddingX: CGFloat = 10
//    private let tagPaddingY: CGFloat = 5
//    private let tagSpacingX: CGFloat = 8
//    private let tagSpacingY: CGFloat = 8
//
//    // MARK: - Constructor
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//
//    func commonInit() {
//        // Initialization code, if any
//    }
//
//    private func updateTagLabels() {
//        // Remove excess tag labels
//        while subviews.count > tagNames.count {
//            subviews[0].removeFromSuperview()
//        }
//
//        // Create and add missing tag labels
//        while subviews.count < tagNames.count {
//            let newLabel = createTagLabel()
//            addSubview(newLabel)
//        }
//
//        // Update text and size of existing labels
//        for (index, tagName) in tagNames.enumerated() {
//            guard let label = subviews[index] as? UILabel else {
//                fatalError("Non-UILabel subview found!")
//            }
//            configureTagLabel(label, with: tagName)
//        }
//
//        displayTagLabels()
//    }
//
//    private func createTagLabel() -> UILabel {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.backgroundColor = .secondGrayTags
//        label.layer.masksToBounds = true
//        label.layer.cornerRadius = 5
//        label.font = .sfpdM16
//        label.textColor = .secondGrayText
//        return label
//    }
//
//    private func configureTagLabel(_ label: UILabel, with tagName: String) {
//        label.text = tagName
//        label.frame.size.width = label.intrinsicContentSize.width + tagPaddingX
//        label.frame.size.height = label.intrinsicContentSize.height + tagPaddingY
//    }
//
//    private func displayTagLabels() {
//        var currentOriginX: CGFloat = 0
//        var currentOriginY: CGFloat = 0
//
//        for label in subviews.compactMap({ $0 as? UILabel }) {
//            if currentOriginX + label.frame.width > bounds.width {
//                currentOriginX = 0
//                currentOriginY += tagHeight + tagSpacingY
//            }
//
//            label.frame.origin.x = currentOriginX
//            label.frame.origin.y = currentOriginY
//
//            currentOriginX += label.frame.width + tagSpacingX
//        }
//
//        intrinsicHeight = currentOriginY + tagHeight
//        invalidateIntrinsicContentSize()
//    }
//
//    override var intrinsicContentSize: CGSize {
//        var size = super.intrinsicContentSize
//        size.height = intrinsicHeight
//        return size
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        displayTagLabels()
//    }
//}
