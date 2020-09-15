# ADT.Interview

Simple SwiftUI app that gets an episode list from the Rick and Morty API

I'm cutting this a little short so I can manage the iOS 14 debacle. Here are some notes:

- I feel like the visual design could be better. If I was working directly with the API team on this, I would recommend adding links to episode-specific assets that could be displayed within the rows and detail views.
- While the yellow I picked for the rows is kind of obnoxious, it's a bit more interesting because it supports dark mode. Also check out the previews in EpisodeRow.swift where I show both in the canvas.
- I'm qualifying the architecture as 'MVVM-ish'. I don't think it's falling into the hardline definition of MVVM, but I am keeping data logic out of the View. The funny thing is how easy it is to just do everything 'in the view' in SwiftUI. It certainly helped me more rapidly build a working feature, but it's close to the MonsterViewController patterns of old.
