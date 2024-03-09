//
//  ProductViewController.swift
//  ShopScreen
//
//  Created by rendi on 09.03.2024.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var ProductContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call renderSale method to display the sale
        renderSale(discountPercentage: 5)
    }
    
    func renderSale(discountPercentage: CGFloat) {
        let size: CGFloat = 65 // Size for the styled view
        let viewToDiscount = createStyledView(withDiscount: discountPercentage, size: size)
        
        // Set the frame of the styled view
        viewToDiscount.frame = CGRect(
            x: ProductContent.frame.width - size,
            y: 0,
            width: size,
            height: size
        )
        
        // Add the styled view to the ProductContent view
        ProductContent.addSubview(viewToDiscount)
    }
    
    // Function to create a styled view with discount and specified size
    func createStyledView(withDiscount discountPercentage: CGFloat, size: CGFloat) -> UIView {
        let styledView = UIView()
        styledView.backgroundColor = .green
        styledView.layer.cornerRadius = size / 2 // Makes it circular
        
        let discountLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size, height: size))
        discountLabel.text = "-\(discountPercentage)%"
        discountLabel.textColor = .black
        discountLabel.textAlignment = .center // Align text at the center
        discountLabel.numberOfLines = 0 // Allow multiple lines if needed
        styledView.addSubview(discountLabel)
        
        return styledView
    }
}
