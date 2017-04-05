import Foundation
import UIKit

class FontFormatter: CharacterAttributeFormatter {

    let traits: UIFontDescriptorSymbolicTraits

    init(traits: UIFontDescriptorSymbolicTraits) {
        self.traits = traits
    }

    func apply(to attributes: [String : Any]) -> [String: Any] {

        var resultingAttributes = attributes
        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return attributes
        }
        let newFont = font.modifyTraits(traits, enable: true)
        resultingAttributes[NSFontAttributeName] = newFont
        
        return resultingAttributes
    }

    func remove(from attributes: [String : Any]) -> [String: Any] {
        var resultingAttributes = attributes
        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return attributes
        }

        let newFont = font.modifyTraits(traits, enable: false)
        resultingAttributes[NSFontAttributeName] = newFont

        return resultingAttributes
    }

    func present(in attributes: [String : Any]) -> Bool {
        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return false
        }
        let enabled = font.containsTraits(traits)
        return enabled
    }
}

class BoldFormatter: FontFormatter {

    init() {
        super.init(traits: .traitBold)
    }
}

class ItalicFormatter: FontFormatter {

    init() {
        super.init(traits: .traitItalic)
    }
}

