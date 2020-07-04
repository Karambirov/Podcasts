//
//  MediaType.swift
//  Podcasts
//
//  Created by Eugene Karambirov on 03.07.2020.
//

public protocol MediaType {
    associatedtype Entity: RawRepresentable where Entity.RawValue == String
    associatedtype Attribute: RawRepresentable where Attribute.RawValue == String
}
