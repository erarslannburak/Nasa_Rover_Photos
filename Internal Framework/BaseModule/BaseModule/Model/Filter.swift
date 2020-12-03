//
//  Filter.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

public protocol Filter {
    func getParemeter() -> String
}

public struct Fhaz:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "fhaz"
    }
}

public struct Rhaz:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "rhaz"
    }
}

public struct Mast:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "mast"
    }
}

public struct Chemcam:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "chemcam"
    }
}

public struct Mahli:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "mahli"
    }
}

public struct Mardi:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "mardi"
    }
}

public struct Navcam:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "navcam"
    }
}

public struct Pancam:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "pancam"
    }
}

public struct Minites:Filter {
    public init() {}

    public func getParemeter() -> String {
        return "minites"
    }
}
