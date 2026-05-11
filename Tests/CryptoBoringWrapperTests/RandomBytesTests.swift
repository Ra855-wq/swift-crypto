//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCrypto open source project
//
// Copyright (c) 2026 Apple Inc. and the SwiftCrypto project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCrypto project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import XCTest

@testable import CryptoBoringWrapper

final class RandomBytesTests: XCTestCase {
    func testInitializeWithRandomBytesWritesOnlyRequestedCount() {
        var bytes = [UInt8](repeating: 0xAA, count: 32)
        bytes.withUnsafeMutableBytes { buffer in
            buffer.initializeWithRandomBytes(count: 8)
        }

        XCTAssertEqual(Array(bytes[8...]), [UInt8](repeating: 0xAA, count: 24))
    }
}
