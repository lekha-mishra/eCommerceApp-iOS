//
//  Mobile.swift
//  eCommerceApp
//
//  Created by IPH Technologies Pvt. Ltd. on 07/07/23.
//

import Foundation

struct Mobile{
    let mobileName: String
    static func defaultMobileList() -> [Mobile] {
        var mobileList = [Mobile]()
        mobileList.append(Mobile(mobileName: "iPhone13Mini"))
        mobileList.append(Mobile(mobileName: "iPhone13ProMax"))
        mobileList.append(Mobile(mobileName: "iPhone14Plus"))
        mobileList.append(Mobile(mobileName: "iPhone14Pro"))
        mobileList.append(Mobile(mobileName: "iPhone14ProMax"))
        return mobileList
    }
}

struct Category{
    let categoryName: String
    static func defaultCategoryList() -> [Category]{
        //empty array
        var categoryList = [Category]()
        categoryList.append(Category(categoryName: "Apple latest searches"))
        categoryList.append(Category(categoryName: "Samsung Most Searched"))
        categoryList.append(Category(categoryName: "GooglePixelSeries"))
        return categoryList
    }
}

struct PaymentOption{
    let paymentType: String
    static func defaultPaymentType() -> [PaymentOption]{
        var paymentTypeList = [PaymentOption]()
        paymentTypeList.append(PaymentOption(paymentType: "Bank Transfer"))
        paymentTypeList.append(PaymentOption(paymentType: "Credit Card"))
        paymentTypeList.append(PaymentOption(paymentType: "Cash On Delivery"))
        return paymentTypeList
    }
}

