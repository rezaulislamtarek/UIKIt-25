//
//  FeedModel.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 12/11/25.
//

// Model
struct Article {
    let title: String
    let author: String
    let date: String
    let summary: String
    let imageUrl: String?
    
    static var articles: [Article] = [
        Article(
            title: "iOS 18 এর নতুন ফিচার প্রকাশ",
            author: "টেক নিউজ",
            date: "২ ঘন্টা আগে",
            summary: "Apple তাদের নতুন iOS 18 এ অনেকগুলো নতুন ফিচার যোগ করেছে যা ডেভেলপারদের জন্য খুবই উপকারী হবে।",
            imageUrl: "https://picsum.photos/400/250?random=1"
        ),
        Article(
            title: "SwiftUI vs UIKit: কোনটা শিখবেন?",
            author: "iOS ডেভ বাংলা",
            date: "৫ ঘন্টা আগে",
            summary: "নতুন iOS ডেভেলপারদের জন্য SwiftUI নাকি UIKit শেখা ভালো হবে তা নিয়ে বিস্তারিত আলোচনা।",
            imageUrl: nil
        ),
        Article(
            title: "Bangladesh এ iOS ডেভেলপার চাকরির বাজার",
            author: "ক্যারিয়ার গাইড",
            date: "১ দিন আগে",
            summary: "বাংলাদেশে iOS ডেভেলপারদের চাহিদা দিন দিন বাড়ছে। জেনে নিন কিভাবে এই ফিল্ডে ক্যারিয়ার গড়বেন।",
            imageUrl: "https://picsum.photos/400/250?random=2"
        ),
        Article(
            title: "Auto Layout Mastery টিপস",
            author: "কোডিং টিউটোরিয়াল",
            date: "২ দিন আগে",
            summary: "Auto Layout এর সব থেকে গুরুত্বপূর্ণ টিপস এবং ট্রিকস যা প্রত্যেক iOS ডেভেলপারের জানা উচিত।",
            imageUrl: nil
        ),
        Article(
            title: "TableView Performance Optimization",
            author: "iOS বেস্ট প্র্যাকটিস",
            date: "৩ দিন আগে",
            summary: "বড় ডাটাসেট নিয়ে কাজ করার সময় TableView এর পারফরম্যান্স কিভাবে improve করবেন।",
            imageUrl: "https://picsum.photos/400/250?random=3"
        ),
        // --- Extra 25 articles added below ---
        Article(
            title: "Combine Framework এর বেসিক ধারণা",
            author: "Swift শেখা",
            date: "৩ দিন আগে",
            summary: "Combine framework ব্যবহার করে কিভাবে reactive programming করা যায় তা নিয়ে আলোচনা।",
            imageUrl: nil
        ),
        Article(
            title: "iOS App Launch Optimization",
            author: "App Speed",
            date: "৪ দিন আগে",
            summary: "App launch time কমানোর জন্য ব্যবহারযোগ্য কিছু কৌশল ও বেস্ট প্র্যাকটিস।",
            imageUrl: "https://picsum.photos/400/250?random=4"
        ),
        Article(
            title: "Swift 6 এ নতুন কী আসছে",
            author: "টেক ইনসাইটস",
            date: "৫ দিন আগে",
            summary: "Swift 6 এ আসতে চলেছে কিছু গুরুত্বপূর্ণ আপডেট এবং language improvement।",
            imageUrl: "https://picsum.photos/400/250?random=5"
        ),
        Article(
            title: "Dark Mode Implementation",
            author: "UI Tips",
            date: "৬ দিন আগে",
            summary: "Dark Mode সাপোর্ট করতে গেলে কোন কোন বিষয়গুলো খেয়াল রাখতে হবে।",
            imageUrl: nil
        ),
        Article(
            title: "Core Data vs Realm",
            author: "Data Layer বাংলা",
            date: "১ সপ্তাহ আগে",
            summary: "iOS অ্যাপে কোন ডাটাবেস সলিউশন বেছে নেওয়া উচিত, Core Data না Realm?",
            imageUrl: "https://picsum.photos/400/250?random=6"
        ),
        Article(
            title: "WidgetKit দিয়ে হোমস্ক্রিন উইজেট বানানো",
            author: "Swift Projects",
            date: "১ সপ্তাহ আগে",
            summary: "WidgetKit ব্যবহার করে কাস্টম হোমস্ক্রিন উইজেট তৈরি করার টিপস।",
            imageUrl: nil
        ),
        Article(
            title: "App Store Optimization (ASO) Tips",
            author: "Marketing Team",
            date: "৮ দিন আগে",
            summary: "আপনার iOS অ্যাপকে App Store এ উপরে তুলতে সাহায্য করবে এই টিপসগুলো।",
            imageUrl: "https://picsum.photos/400/250?random=7"
        ),
        Article(
            title: "Swift Concurrency Explained",
            author: "Async Await Guide",
            date: "৯ দিন আগে",
            summary: "Swift এ নতুন Concurrency মডেল কীভাবে কাজ করে এবং কীভাবে ব্যবহার করবেন।",
            imageUrl: nil
        ),
        Article(
            title: "UIKit Animations Deep Dive",
            author: "Animation World",
            date: "১০ দিন আগে",
            summary: "UIKit দিয়ে এনিমেশন তৈরি করার কিছু উন্নত কৌশল।",
            imageUrl: "https://picsum.photos/400/250?random=8"
        ),
        Article(
            title: "Xcode Shortcuts You Must Know",
            author: "Productivity Boost",
            date: "১১ দিন আগে",
            summary: "Xcode এ দ্রুত কাজ করার জন্য কিছু দরকারি শর্টকাট।",
            imageUrl: nil
        ),
        Article(
            title: "SwiftUI NavigationStack Explained",
            author: "iOS UI Patterns",
            date: "১২ দিন আগে",
            summary: "NavigationStack এর মাধ্যমে SwiftUI তে কিভাবে নেভিগেশন পরিচালনা করবেন।",
            imageUrl: "https://picsum.photos/400/250?random=9"
        ),
        Article(
            title: "TestFlight দিয়ে Beta Testing",
            author: "App Testing Hub",
            date: "২ সপ্তাহ আগে",
            summary: "TestFlight ব্যবহার করে কিভাবে সহজে আপনার অ্যাপ টেস্টারদের দিতে পারেন।",
            imageUrl: nil
        ),
        Article(
            title: "MVVM Architecture in SwiftUI",
            author: "Design Patterns",
            date: "২ সপ্তাহ আগে",
            summary: "MVVM প্যাটার্ন ব্যবহার করে কিভাবে SwiftUI প্রোজেক্ট গঠন করবেন।",
            imageUrl: "https://picsum.photos/400/250?random=10"
        ),
        Article(
            title: "Push Notification Setup Guide",
            author: "Server Connect",
            date: "১৫ দিন আগে",
            summary: "Firebase Cloud Messaging ব্যবহার করে Push Notification সেটআপ।",
            imageUrl: nil
        ),
        Article(
            title: "In-App Purchase Implementation",
            author: "Monetization Guide",
            date: "১৬ দিন আগে",
            summary: "iOS অ্যাপে In-App Purchase যুক্ত করার জন্য দরকারি স্টেপ-বাই-স্টেপ গাইড।",
            imageUrl: "https://picsum.photos/400/250?random=11"
        ),
        Article(
            title: "Swift Package Manager Explained",
            author: "Dependency Manager",
            date: "১৭ দিন আগে",
            summary: "Swift Package Manager দিয়ে ডিপেন্ডেন্সি ম্যানেজ করার পদ্ধতি।",
            imageUrl: nil
        ),
        Article(
            title: "Accessibility in iOS Apps",
            author: "Inclusive Design",
            date: "১৮ দিন আগে",
            summary: "iOS অ্যাপগুলোকে আরও বেশি অ্যাক্সেসিবল করার জন্য কিছু দরকারি টিপস।",
            imageUrl: "https://picsum.photos/400/250?random=12"
        ),
        Article(
            title: "ARKit দিয়ে Augmented Reality",
            author: "Tech Vision",
            date: "১৯ দিন আগে",
            summary: "ARKit এর মাধ্যমে কিভাবে AR অ্যাপ তৈরি করবেন তার বেসিক ধারণা।",
            imageUrl: nil
        ),
        Article(
            title: "App Security Best Practices",
            author: "Secure Dev",
            date: "২০ দিন আগে",
            summary: "iOS অ্যাপ ডেভেলপ করার সময় সিকিউরিটি নিয়ে যেসব বিষয় খেয়াল রাখা উচিত।",
            imageUrl: "https://picsum.photos/400/250?random=13"
        ),
        Article(
            title: "SwiftUI Animations সহজে শেখা",
            author: "Design Motion",
            date: "২১ দিন আগে",
            summary: "SwiftUI এর animation system কিভাবে কাজ করে এবং কীভাবে ব্যবহার করবেন।",
            imageUrl: nil
        ),
        Article(
            title: "App Clips Overview",
            author: "Apple Docs বাংলা",
            date: "২২ দিন আগে",
            summary: "App Clips ব্যবহার করে ছোট সাইজের দ্রুত লোডিং অ্যাপ তৈরি করা যায়।",
            imageUrl: "https://picsum.photos/400/250?random=14"
        ),
        Article(
            title: "Localization in iOS Apps",
            author: "MultiLang Dev",
            date: "২৩ দিন আগে",
            summary: "কিভাবে আপনার অ্যাপকে বহুভাষিক করা যায়।",
            imageUrl: nil
        ),
        Article(
            title: "Networking with URLSession",
            author: "Swift Networkers",
            date: "২৪ দিন আগে",
            summary: "URLSession ব্যবহার করে কিভাবে API থেকে ডাটা ফেচ করবেন।",
            imageUrl: "https://picsum.photos/400/250?random=15"
        ),
        Article(
            title: "Combine with SwiftUI",
            author: "Reactive Dev",
            date: "২৫ দিন আগে",
            summary: "Combine framework এবং SwiftUI একসাথে ব্যবহার করার কৌশল।",
            imageUrl: nil
        ),
        Article(
            title: "Memory Management in iOS",
            author: "ARC Explained",
            date: "২৬ দিন আগে",
            summary: "Automatic Reference Counting (ARC) এর কাজ ও গুরুত্ব।",
            imageUrl: "https://picsum.photos/400/250?random=16"
        ),
        Article(
            title: "App Performance Monitoring Tools",
            author: "Debugging Hub",
            date: "২৭ দিন আগে",
            summary: "iOS অ্যাপের পারফরম্যান্স ট্র্যাক করার জন্য জনপ্রিয় কিছু টুল।",
            imageUrl: "https://picsum.photos/400/250?random=17"
        ),
        Article(
            title: "SwiftUI Layout System Explained",
            author: "UI Foundation",
            date: "২৮ দিন আগে",
            summary: "SwiftUI এর layout system এর কাজের ধরন বিস্তারিতভাবে আলোচনা।",
            imageUrl: nil
        ),
        Article(
            title: "App Distribution Guide",
            author: "Deploy Experts",
            date: "২৯ দিন আগে",
            summary: "App Store এ অ্যাপ আপলোড করার ধাপে ধাপে গাইড।",
            imageUrl: "https://picsum.photos/400/250?random=18"
        ),
        Article(
            title: "Intro to Swift Macros",
            author: "Swift Evolution",
            date: "৩০ দিন আগে",
            summary: "Swift macros দিয়ে কিভাবে কোড অটোমেশন করা যায়।",
            imageUrl: "https://picsum.photos/400/250?random=19"
        )
    ]

}
