//
//  CastDetailData.swift
//  ChargeFlixTests
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation
@testable import ChargeFlix

// id = 3
let castData = """
{
    "adult": false,
    "also_known_as": [
        "Том Круз",
        "Toms Krzs"
    ],
    "birthday": "1962-07-03",
    "deathday": null,
    "gender": 2,
    "homepage": "http://www.tomcruise.com",
    "id": 500,
    "imdb_id": "nm0000129",
    "known_for_department": "Acting",
    "name": "Tom Cruise",
    "place_of_birth": "Syracuse, New York, USA",
    "popularity": 55.93,
    "profile_path": "/8qBylBsQf4llkGrWR3qAsOtOU8O.jpg",
    "images": {
        "profiles": [
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": null,
                "file_path": "/8qBylBsQf4llkGrWR3qAsOtOU8O.jpg",
                "vote_average": 5.346,
                "vote_count": 52,
                "width": 1400
            },
            {
                "aspect_ratio": 0.667,
                "height": 861,
                "iso_639_1": null,
                "file_path": "/eOh4ubpOm2Igdg0QH2ghj0mFtC.jpg",
                "vote_average": 5.328,
                "vote_count": 38,
                "width": 574
            },
            {
                "aspect_ratio": 0.667,
                "height": 720,
                "iso_639_1": null,
                "file_path": "/57wg0qQcS3OUl7euj1kQItGn05r.jpg",
                "vote_average": 5.292,
                "vote_count": 18,
                "width": 480
            },
            {
                "aspect_ratio": 0.666,
                "height": 1016,
                "iso_639_1": null,
                "file_path": "/5sjLDtdwjuVdZNdrnbAwDQdn5W.jpg",
                "vote_average": 5.244,
                "vote_count": 21,
                "width": 677
            },
            {
                "aspect_ratio": 0.667,
                "height": 1500,
                "iso_639_1": null,
                "file_path": "/h6ShtVkFKOaBaWhAAUbdmHIpkak.jpg",
                "vote_average": 5.226,
                "vote_count": 15,
                "width": 1000
            },
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": null,
                "file_path": "/rZXZWW00hiZyVVBtXKBozAAq0Cf.jpg",
                "vote_average": 5.19,
                "vote_count": 37,
                "width": 1400
            },
            {
                "aspect_ratio": 0.667,
                "height": 852,
                "iso_639_1": null,
                "file_path": "/yUsSJ0vO8AM9HnDQWuGKMSzCKOP.jpg",
                "vote_average": 5.172,
                "vote_count": 16,
                "width": 568
            },
            {
                "aspect_ratio": 0.666,
                "height": 800,
                "iso_639_1": null,
                "file_path": "/gextEr8Tz4qT7Cwv1Xc82S7cTHx.jpg",
                "vote_average": 5.136,
                "vote_count": 21,
                "width": 533
            },
            {
                "aspect_ratio": 0.667,
                "height": 840,
                "iso_639_1": null,
                "file_path": "/9pTIJwjH3Wg8JAxt0TNTpu0cXK0.jpg",
                "vote_average": 5.128,
                "vote_count": 19,
                "width": 560
            },
            {
                "aspect_ratio": 0.667,
                "height": 1800,
                "iso_639_1": null,
                "file_path": "/2Dkx4uuGoWFrPSitxdikv9z5azR.jpg",
                "vote_average": 5.108,
                "vote_count": 39,
                "width": 1200
            },
            {
                "aspect_ratio": 0.667,
                "height": 600,
                "iso_639_1": null,
                "file_path": "/s57wicK5nPuYhglUFUWECjnomJL.jpg",
                "vote_average": 5.078,
                "vote_count": 20,
                "width": 400
            },
            {
                "aspect_ratio": 0.667,
                "height": 994,
                "iso_639_1": null,
                "file_path": "/vQFCioXTiCBBJaWeBDKD8mXZJ8V.jpg",
                "vote_average": 5.068,
                "vote_count": 18,
                "width": 663
            },
            {
                "aspect_ratio": 0.667,
                "height": 1500,
                "iso_639_1": null,
                "file_path": "/bn9CwMSM3o4XPZEPZdQ3grslGup.jpg",
                "vote_average": 5.058,
                "vote_count": 27,
                "width": 1000
            },
            {
                "aspect_ratio": 0.667,
                "height": 1440,
                "iso_639_1": null,
                "file_path": "/cMwXD3eiUfStgVh1gpVcwCnNelv.jpg",
                "vote_average": 4.956,
                "vote_count": 18,
                "width": 960
            }
        ]
    },
    "movie_credits": {
        "cast": [
            {
                "adult": false,
                "backdrop_path": "/nH6hPhJq3EEv9CnBZgXU3IQnpJo.jpg",
                "genre_ids": [
                    12,
                    53,
                    878
                ],
                "id": 74,
                "original_language": "en",
                "original_title": "War of the Worlds",
                "overview": "Ray Ferrier is a divorced dockworker and less-than-perfect father. Soon after his ex-wife and her new husband drop off his teenage son and young daughter for a rare weekend visit, a strange and powerful lightning storm touches down.",
                "popularity": 44.265,
                "poster_path": "/6Biy7R9LfumYshur3YKhpj56MpB.jpg",
                "release_date": "2005-06-28",
                "title": "War of the Worlds",
                "video": false,
                "vote_average": 6.5,
                "vote_count": 7788,
                "character": "Ray Ferrier",
                "credit_id": "52fe4213c3a36847f800226b",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/qq4H9JfBKQ5DarMLI6lhUQjn9D7.jpg",
                "genre_ids": [
                    878,
                    28,
                    53
                ],
                "id": 180,
                "original_language": "en",
                "original_title": "Minority Report",
                "overview": "John Anderton is a top 'Precrime' cop in the late-21st century, when technology can predict crimes before they're committed. But Anderton becomes the quarry when another investigator targets him for a murder charge.",
                "popularity": 31.01,
                "poster_path": "/ccqpHq5tk5W4ymbSbuoy4uYOxFI.jpg",
                "release_date": "2002-06-20",
                "title": "Minority Report",
                "video": false,
                "vote_average": 7.342,
                "vote_count": 8091,
                "character": "Chief John Anderton [Pre-Crime]",
                "credit_id": "52fe4223c3a36847f8006f53",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/vYA4qUPWY0EbjpcIXAL4h4pVmTC.jpg",
                "genre_ids": [
                    18,
                    53,
                    9648
                ],
                "id": 345,
                "original_language": "en",
                "original_title": "Eyes Wide Shut",
                "overview": "After Dr. Bill Harford's wife, Alice, admits to having sexual fantasies about a man she met, Bill becomes obsessed with having a sexual encounter. He discovers an underground sexual group and attends one of their meetings -- and quickly discovers that he is in over his head.",
                "popularity": 43.982,
                "poster_path": "/knEIz1eNGl5MQDbrEAVWA7iRqF9.jpg",
                "release_date": "1999-07-16",
                "title": "Eyes Wide Shut",
                "video": false,
                "vote_average": 7.473,
                "vote_count": 5616,
                "character": "Dr. William Harford",
                "credit_id": "52fe423ac3a36847f800df1b",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/mxlXUzriCrR51C1o4gSJalU1NNk.jpg",
                "genre_ids": [
                    18,
                    28,
                    10752
                ],
                "id": 616,
                "original_language": "en",
                "original_title": "The Last Samurai",
                "overview": "Nathan Algren is an American hired to instruct the Japanese army in the ways of modern warfare, which finds him learning to respect the samurai and the honorable principles that rule them. Pressed to destroy the samurai's way of life in the name of modernization and open trade, Algren decides to become an ultimate warrior himself and to fight for their right to exist.",
                "popularity": 42.865,
                "poster_path": "/lsasOSgYI85EHygtT5SvcxtZVYT.jpg",
                "release_date": "2003-12-05",
                "title": "The Last Samurai",
                "video": false,
                "vote_average": 7.575,
                "vote_count": 6349,
                "character": "Nathan Algren",
                "credit_id": "52fe425ec3a36847f8018e41",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/jILeJ60zPpIjjJHGSmIeY4eO30t.jpg",
                "genre_ids": [
                    10749,
                    18,
                    28
                ],
                "id": 744,
                "original_language": "en",
                "original_title": "Top Gun",
                "overview": "For Lieutenant Pete 'Maverick' Mitchell and his friend and co-pilot Nick 'Goose' Bradshaw, being accepted into an elite training school for fighter pilots is a dream come true. But a tragedy, as well as personal demons, will threaten Pete's dreams of becoming an ace pilot.",
                "popularity": 68.02,
                "poster_path": "/xUuHj3CgmZQ9P2cMaqQs4J0d4Zc.jpg",
                "release_date": "1986-05-16",
                "title": "Top Gun",
                "video": false,
                "vote_average": 7.0,
                "vote_count": 7784,
                "character": "Lt. Pete 'Maverick' Mitchell",
                "credit_id": "52fe426fc3a36847f801e6b9",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/3fChciF2G1wXHsyTfJD9y7uN6Il.jpg",
                "genre_ids": [
                    27,
                    18,
                    14
                ],
                "id": 628,
                "original_language": "en",
                "original_title": "Interview with the Vampire",
                "overview": "A vampire relates his epic life story of love, betrayal, loneliness, and dark hunger to an over-curious reporter.",
                "popularity": 38.196,
                "poster_path": "/2162lAT2MP36MyJd2sttmj5du5T.jpg",
                "release_date": "1994-11-11",
                "title": "Interview with the Vampire",
                "video": false,
                "vote_average": 7.382,
                "vote_count": 5381,
                "character": "Lestat",
                "credit_id": "52fe4260c3a36847f80199fd",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/sjcPWJ5TXgFglsoixNxyZRyEUq3.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 956,
                "original_language": "en",
                "original_title": "Mission: Impossible III",
                "overview": "Retired from active duty, and training recruits for the Impossible Mission Force, agent Ethan Hunt faces the toughest foe of his career: Owen Davian, an international broker of arms and information, who is as cunning as he is ruthless. Davian emerges to threaten Hunt and all that he holds dear -- including the woman Hunt loves.",
                "popularity": 57.167,
                "poster_path": "/3VianLpu8hhmq4TTItKPaCtA5su.jpg",
                "release_date": "2006-04-25",
                "title": "Mission: Impossible III",
                "video": false,
                "vote_average": 6.724,
                "vote_count": 6257,
                "character": "Ethan Hunt",
                "credit_id": "52fe4293c3a36847f802977d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/H40nWdJngUc6gtytMAbElm9HOu.jpg",
                "genre_ids": [
                    18
                ],
                "id": 881,
                "original_language": "en",
                "original_title": "A Few Good Men",
                "overview": "When cocky military lawyer Lt. Daniel Kaffee and his co-counsel, Lt. Cmdr. JoAnne Galloway, are assigned to a murder case, they uncover a hazing ritual that could implicate high-ranking officials such as shady Col. Nathan Jessep.",
                "popularity": 28.19,
                "poster_path": "/rLOk4z9zL1tTukIYV56P94aZXKk.jpg",
                "release_date": "1992-12-11",
                "title": "A Few Good Men",
                "video": false,
                "vote_average": 7.525,
                "vote_count": 3222,
                "character": "Lt. Daniel Kaffee",
                "credit_id": "52fe4286c3a36847f8025da7",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/sra8XnL96OyLHENcglmZJg6HA8z.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 954,
                "original_language": "en",
                "original_title": "Mission: Impossible",
                "overview": "When Ethan Hunt, the leader of a crack espionage team whose perilous operation has gone awry with no explanation, discovers that a mole has penetrated the CIA, he's surprised to learn that he's the No. 1 suspect. To clear his name, Hunt now must ferret out the real double agent and, in the process, even the score.",
                "popularity": 77.964,
                "poster_path": "/l5uxY5m5OInWpcExIpKG6AR3rgL.jpg",
                "release_date": "1996-05-22",
                "title": "Mission: Impossible",
                "video": false,
                "vote_average": 6.969,
                "vote_count": 8179,
                "character": "Ethan Hunt",
                "credit_id": "52fe4293c3a36847f8029509",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/24DZfupDlhXeTchmcOkoGRhP5Vg.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 955,
                "original_language": "en",
                "original_title": "Mission: Impossible II",
                "overview": "With computer genius Luther Stickell at his side and a beautiful thief on his mind, agent Ethan Hunt races across Australia and Spain to stop a former IMF agent from unleashing a genetically engineered biological weapon called Chimera. This mission, should Hunt choose to accept it, plunges him into the center of an international crisis of terrifying magnitude.",
                "popularity": 49.752,
                "poster_path": "/7us8nE3ldE0gX2cziUz4tKg0Go0.jpg",
                "release_date": "2000-05-24",
                "title": "Mission: Impossible II",
                "video": false,
                "vote_average": 6.118,
                "vote_count": 6195,
                "character": "Ethan Hunt",
                "credit_id": "52fe4293c3a36847f8029665",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/nrDDTgU0tAHVlwCQ02cUWlPGtiQ.jpg",
                "genre_ids": [
                    18,
                    80,
                    53
                ],
                "id": 1538,
                "original_language": "en",
                "original_title": "Collateral",
                "overview": "Cab driver Max picks up a man who offers him $600 to drive him around. But the promise of easy money sours when Max realizes his fare is an assassin.",
                "popularity": 27.584,
                "poster_path": "/iOpi3ut5DhQIbrVVjlnmfy2U7dI.jpg",
                "release_date": "2004-08-04",
                "title": "Collateral",
                "video": false,
                "vote_average": 7.215,
                "vote_count": 5130,
                "character": "Vincent",
                "credit_id": "52fe42fbc3a36847f8031857",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/eGzzbfmnXMaa4LZnJVquP1llZ2R.jpg",
                "genre_ids": [
                    9648,
                    878,
                    10749,
                    14,
                    53,
                    18
                ],
                "id": 1903,
                "original_language": "en",
                "original_title": "Vanilla Sky",
                "overview": "David Aames has it all: wealth, good looks and gorgeous women on his arm. But just as he begins falling for the warmhearted Sofia, his face is horribly disfigured in a car accident. That's just the beginning of his troubles as the lines between illusion and reality, between life and death, are blurred.",
                "popularity": 30.559,
                "poster_path": "/l1MBK6BUkZtjEqceEMubDUtvvK3.jpg",
                "release_date": "2001-12-10",
                "title": "Vanilla Sky",
                "video": false,
                "vote_average": 6.814,
                "vote_count": 3839,
                "character": "David Aames",
                "credit_id": "52fe4320c3a36847f803c36d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/7iXHBVKPPCO19yHHnHjL0D16i4e.jpg",
                "genre_ids": [
                    12,
                    28,
                    18
                ],
                "id": 2119,
                "original_language": "en",
                "original_title": "Days of Thunder",
                "overview": "Talented but unproven stock car driver Cole Trickle gets a break and with the guidance of veteran Harry Hogge turns heads on the track. The young hotshot develops a rivalry with a fellow racer that threatens his career when the two smash their cars. But with the help of his doctor, Cole just might overcome his injuries-- and his fear.",
                "popularity": 28.781,
                "poster_path": "/4kHzXHRJGcRxxRvkCvb5yTxZwml.jpg",
                "release_date": "1990-06-27",
                "title": "Days of Thunder",
                "video": false,
                "vote_average": 6.352,
                "vote_count": 1328,
                "character": "Cole Trickle",
                "credit_id": "52fe4338c3a36847f8043555",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/h1bNQ2MZzKLuKa7N0nOuSXlgMwT.jpg",
                "genre_ids": [
                    18,
                    53,
                    10752
                ],
                "id": 2253,
                "original_language": "en",
                "original_title": "Valkyrie",
                "overview": "Wounded in Africa during World War II, Nazi Col. Claus von Stauffenberg returns to his native Germany and joins the Resistance in a daring plan to create a shadow government and assassinate Adolf Hitler. When events unfold so that he becomes a central player, he finds himself tasked with both leading the coup and personally killing the Führer.",
                "popularity": 35.799,
                "poster_path": "/8eoRtXswC8IQDsqW7iJWO56NhAv.jpg",
                "release_date": "2008-12-25",
                "title": "Valkyrie",
                "video": false,
                "vote_average": 6.916,
                "vote_count": 3411,
                "character": "Claus Schenk Graf von Stauffenberg",
                "credit_id": "52fe4346c3a36847f8047a79",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/gjZFMKtoJdpEDt3T0dnoiMfXYof.jpg",
                "genre_ids": [
                    18,
                    10752
                ],
                "id": 2604,
                "original_language": "en",
                "original_title": "Born on the Fourth of July",
                "overview": "Paralyzed in the Vietnam war, Ron Kovic becomes an anti-war and pro-human rights political activist after feeling betrayed by the country he fought for.",
                "popularity": 18.696,
                "poster_path": "/k5HfnMgaREHDNA7CugiETCb9ItM.jpg",
                "release_date": "1989-12-20",
                "title": "Born on the Fourth of July",
                "video": false,
                "vote_average": 6.997,
                "vote_count": 1547,
                "character": "Ron Kovic",
                "credit_id": "52fe435fc3a36847f804f4bf",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/2Rx61lWWkxR0jeaBi0H0CJQm35b.jpg",
                "genre_ids": [
                    99
                ],
                "id": 30416,
                "original_language": "en",
                "original_title": "Stanley Kubrick: A Life in Pictures",
                "overview": "With commentary from Hollywood stars, outtakes from his movies and footage from his youth, this documentary looks at Stanley Kubrick's life and films. Director Jan Harlan, Kubrick's brother-in-law and sometime collaborator, interviews heavyweights like Jack Nicholson, Woody Allen and Sydney Pollack, who explain the influence of Kubrick classics like Dr. Strangelove and 2001: A Space Odyssey, and how he absorbed visual clues from disposable culture such as television commercials.",
                "popularity": 9.138,
                "poster_path": "/yGrzFNyc9ztyAJejneh9734Y9Uj.jpg",
                "release_date": "2001-05-02",
                "title": "Stanley Kubrick: A Life in Pictures",
                "video": false,
                "vote_average": 7.425,
                "vote_count": 174,
                "character": "Self - Narrator (voice)",
                "credit_id": "52fe44179251416c91004967",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/1MTBsjWk2nlcRLrAvgpB1uj00TC.jpg",
                "genre_ids": [
                    12,
                    18,
                    10749,
                    37
                ],
                "id": 11259,
                "original_language": "en",
                "original_title": "Far and Away",
                "overview": "A young man leaves Ireland with his landlord's daughter after some trouble with her father, and they dream of owning land at the big giveaway in Oklahoma ca. 1893. When they get to the new land, they find jobs and begin saving money. The man becomes a local barehands boxer, and rides in glory until he is beaten, then his employers steal all the couple's money and they must fight off starvation in the winter, and try to keep their dream of owning land alive. Meanwhile, the woman's parents find out where she has gone and have come to America to find her and take her back.",
                "popularity": 22.294,
                "poster_path": "/rbxvGXcD7fixrAsbiAYl9R76uDs.jpg",
                "release_date": "1992-05-22",
                "title": "Far and Away",
                "video": false,
                "vote_average": 6.7,
                "vote_count": 1100,
                "character": "Joseph Donnelly",
                "credit_id": "52fe441c9251416c7502916d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/f51xtUWSCeL4DXjTZwFSECOOeDX.jpg",
                "genre_ids": [
                    10749,
                    18,
                    35
                ],
                "id": 7520,
                "original_language": "en",
                "original_title": "Cocktail",
                "overview": "After being discharged from the Army, Brian Flanagan moves back to Queens and takes a job in a bar run by Doug Coughlin, who teaches Brian the fine art of bar-tending. Brian quickly becomes a patron favorite with his flashy drink-mixing style, and Brian adopts his mentor's cynical philosophy on life and goes for the money.",
                "popularity": 16.784,
                "poster_path": "/jFRhEPhtsln9tDwzMdZN3OlhUob.jpg",
                "release_date": "1988-07-29",
                "title": "Cocktail",
                "video": false,
                "vote_average": 6.1,
                "vote_count": 1316,
                "character": "Brian Flanagan",
                "credit_id": "52fe4482c3a36847f809a58d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/3g8rLMw0SbA0h2GHiOCBoqFTXVq.jpg",
                "genre_ids": [
                    12,
                    14
                ],
                "id": 11976,
                "original_language": "en",
                "original_title": "Legend",
                "overview": "Set in a timeless mythical forest inhabited by fairies, goblins, unicorns and mortals, this fantastic story follows a mystical forest dweller, chosen by fate, to undertake a heroic quest. He must save the beautiful Princess  Lili and defeat the demonic Lord of Darkness, or the world will be plunged into a never-ending ice age.",
                "popularity": 26.138,
                "poster_path": "/6n3PQSYpZRK5YPk2w8JEwED7AZk.jpg",
                "release_date": "1985-08-28",
                "title": "Legend",
                "video": false,
                "vote_average": 6.219,
                "vote_count": 1103,
                "character": "Jack",
                "credit_id": "52fe44ae9251416c7503d3ed",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/7PP28rV67UcIPlcWymGIcdcwCau.jpg",
                "genre_ids": [
                    10749,
                    35,
                    18
                ],
                "id": 9346,
                "original_language": "en",
                "original_title": "Risky Business",
                "overview": "Meet Joel Goodson, an industrious, college-bound 17-year-old and a responsible, trustworthy son. However, when his parents go away and leave him home alone in the wealthy Chicago suburbs with the Porsche at his disposal he quickly decides he has been good for too long and it is time to enjoy himself. After an unfortunate incident with the Porsche Joel must raise some cash, in a risky way.",
                "popularity": 19.639,
                "poster_path": "/82KOHShH9raGhkcAN3TztVjqjj3.jpg",
                "release_date": "1983-08-05",
                "title": "Risky Business",
                "video": false,
                "vote_average": 6.588,
                "vote_count": 1164,
                "character": "Joel Goodson",
                "credit_id": "52fe44ebc3a36847f80b1c4b",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/n1Gh3MJAVvXmkgSDf3SOLlPCjag.jpg",
                "genre_ids": [
                    35,
                    18,
                    10749
                ],
                "id": 9390,
                "original_language": "en",
                "original_title": "Jerry Maguire",
                "overview": "Jerry Maguire used to be a typical sports agent: willing to do just about anything he could to get the biggest possible contracts for his clients, plus a nice commission for himself. Then, one day, he suddenly has second thoughts about what he's really doing. When he voices these doubts, he ends up losing his job and all of his clients, save Rod Tidwell, an egomaniacal football player.",
                "popularity": 21.828,
                "poster_path": "/lABvGN7fDk5ifnwZoxij6G96t2w.jpg",
                "release_date": "1996-12-13",
                "title": "Jerry Maguire",
                "video": false,
                "vote_average": 6.947,
                "vote_count": 2983,
                "character": "Jerry Maguire",
                "credit_id": "52fe44f1c3a36847f80b33a9",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/paZnWUNBeDcyYHFcX9uy1NO2ApW.jpg",
                "genre_ids": [
                    35
                ],
                "id": 33676,
                "original_language": "en",
                "original_title": "Losin' It",
                "overview": "Set in 1965, four Los Angeles school friends -- Woody, Dave, Spider and Wendell -- go on a series of misadventures when they head to Tijuana, Mexico, for a night of cruisin', causing trouble, and to lose their virginity.",
                "popularity": 8.5,
                "poster_path": "/yOrYbvnJKxtRhr3zmieGHs0crXh.jpg",
                "release_date": "1982-08-20",
                "title": "Losin' It",
                "video": false,
                "vote_average": 4.984,
                "vote_count": 88,
                "character": "Woody",
                "credit_id": "52fe452e9251416c9102a245",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/rB4oTSg3PkH828b3hwn231brzwh.jpg",
                "genre_ids": [
                    18,
                    9648,
                    53
                ],
                "id": 37233,
                "original_language": "en",
                "original_title": "The Firm",
                "overview": "Mitch McDeere is a young man with a promising future in Law. About to sit his Bar exam, he is approached by 'The Firm' and made an offer he doesn't refuse. Seduced by the money and gifts showered on him, he is totally oblivious to the more sinister side of his company. Then, two Associates are murdered. The FBI contact him, asking him for information and suddenly his life is ruined. He has a choice - work with the FBI, or stay with the Firm. Either way he will lose his life as he knows it. Mitch figures the only way out is to follow his own plan...",
                "popularity": 23.433,
                "poster_path": "/mTsDqwE4ZyZ8FWflD0wPw9l2YMS.jpg",
                "release_date": "1993-06-30",
                "title": "The Firm",
                "video": false,
                "vote_average": 6.736,
                "vote_count": 1815,
                "character": "Mitch McDeere",
                "credit_id": "52fe46359251416c9104cee9",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/grHeT4GGDmVcreyuS0D53DlFD5p.jpg",
                "genre_ids": [
                    28,
                    35
                ],
                "id": 37834,
                "original_language": "en",
                "original_title": "Knight and Day",
                "overview": "A fugitive couple goes on a glamorous and sometimes deadly adventure where nothing and no one – even themselves – are what they seem. Amid shifting alliances and unexpected betrayals, they race across the globe, with their survival ultimately hinging on the battle of truth vs. trust.",
                "popularity": 30.126,
                "poster_path": "/phhp52CZZJiGYmiOTp9ZBDkGHB3.jpg",
                "release_date": "2010-06-15",
                "title": "Knight and Day",
                "video": false,
                "vote_average": 6.195,
                "vote_count": 4162,
                "character": "Roy Miller",
                "credit_id": "52fe46739251416c91054d65",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/5OAgCNzFS1dgIQ9jtAlbn2v4dvV.jpg",
                "genre_ids": [
                    10749,
                    18
                ],
                "id": 18172,
                "original_language": "en",
                "original_title": "All the Right Moves",
                "overview": "Sensitive study of a headstrong high school football star who dreams of getting out of his small Western Pennsylvania steel town with a football scholarship. His equally ambitious coach aims at a college position, resulting in a clash which could crush the player's dreams.",
                "popularity": 14.677,
                "poster_path": "/nJb52AhNkctIzJWQc7IFYvyL2oe.jpg",
                "release_date": "1983-10-21",
                "title": "All the Right Moves",
                "video": false,
                "vote_average": 5.7,
                "vote_count": 230,
                "character": "Stefen Djordjevic",
                "credit_id": "52fe47659251416c75097d45",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/kfyLvdWaXlvXWSvKGYjA1JFxsAl.jpg",
                "genre_ids": [
                    99
                ],
                "id": 18221,
                "original_language": "en",
                "original_title": "Space Station 3D",
                "overview": "Some 220 miles above Earth lies the International Space Station, a one-of-a-kind outer space laboratory that 16 nations came together to build. Get a behind-the-scenes look at the making of this extraordinary structure in this spectacular IMAX film. Viewers will blast off from Florida's Kennedy Space Center and the Baikonur Cosmodrome in Russia for this incredible journey -- IMAX's first-ever space film. Tom Cruise narrates.",
                "popularity": 5.802,
                "poster_path": "/sCpUJvoH6xjOugbrcpZTt0LCTMm.jpg",
                "release_date": "2002-04-17",
                "title": "Space Station 3D",
                "video": false,
                "vote_average": 6.4,
                "vote_count": 42,
                "character": "Narrator (voice)",
                "credit_id": "52fe476a9251416c75098899",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/5g44s5wSJVCenIecvujeO6xMu18.jpg",
                "genre_ids": [
                    99,
                    10770
                ],
                "id": 51904,
                "original_language": "en",
                "original_title": "Industrial Light & Magic: Creating the Impossible",
                "overview": "Leslie Iwerks' documentary takes audiences behind the scenes at ILM with in depth interviews with some of the company's top talent and showcases never before seen footage highlighting many of their pioneering milestones. From creating the first ever computer generated character in a feature film to the latest advancements in visual effects for film franchises like Transformers and Iron Man, ILM has created some of the most memorable movie moments in recent history.",
                "popularity": 6.754,
                "poster_path": "/2RfguqaBZ58cBdWaQ2X7nkzKt2K.jpg",
                "release_date": "2010-11-12",
                "title": "Industrial Light & Magic: Creating the Impossible",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 29,
                "character": "Narrator (voice)",
                "credit_id": "52fe480cc3a36847f8155aa3",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/ih4lZkUpmSE7AP3maymiO72xJ1z.jpg",
                "genre_ids": [
                    28,
                    53,
                    12
                ],
                "id": 56292,
                "original_language": "en",
                "original_title": "Mission: Impossible - Ghost Protocol",
                "overview": "Ethan Hunt and his team are racing against time to track down a dangerous terrorist named Hendricks, who has gained access to Russian nuclear launch codes and is planning a strike on the United States. An attempt to stop him ends in an explosion causing severe destruction to the Kremlin and the IMF to be implicated in the bombing, forcing the President to disavow them. No longer being aided by the government, Ethan and his team chase Hendricks around the globe, although they might still be too late to stop a disaster.",
                "popularity": 89.37,
                "poster_path": "/psiWp3VTjznfokmGQG9uqiiknQQ.jpg",
                "release_date": "2011-12-07",
                "title": "Mission: Impossible - Ghost Protocol",
                "video": false,
                "vote_average": 7.072,
                "vote_count": 9290,
                "character": "Ethan Hunt",
                "credit_id": "52fe48f7c3a36847f8182983",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/19AqfWi8S99tDmp7hskCeDQuwLU.jpg",
                "genre_ids": [
                    28,
                    878,
                    12,
                    9648
                ],
                "id": 75612,
                "original_language": "en",
                "original_title": "Oblivion",
                "overview": "Jack Harper is one of the last few drone repairmen stationed on Earth. Part of a massive operation to extract vital resources after decades of war with a terrifying threat known as the Scavs, Jack’s mission is nearly complete. His existence is brought crashing down when he rescues a beautiful  stranger from a downed spacecraft. Her arrival triggers a chain of events that  forces him to question everything he knows and puts the fate of humanity in his hands.",
                "popularity": 41.314,
                "poster_path": "/eO3r38fwnhb58M1YgcjQBd3VNcp.jpg",
                "release_date": "2013-04-10",
                "title": "Oblivion",
                "video": false,
                "vote_average": 6.621,
                "vote_count": 10080,
                "character": "Jack",
                "credit_id": "52fe4909c3a368484e1175c3",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg",
                "genre_ids": [
                    80,
                    18,
                    53,
                    28
                ],
                "id": 75780,
                "original_language": "en",
                "original_title": "Jack Reacher",
                "overview": "When a gunman takes five lives with six shots, all evidence points to the suspect in custody. On interrogation, the suspect offers up a single note: Get Jack Reacher! So begins an extraordinary chase for the truth, pitting Jack Reacher against an unexpected enemy, with a skill for violence and a secret to keep.",
                "popularity": 65.423,
                "poster_path": "/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg",
                "release_date": "2012-12-20",
                "title": "Jack Reacher",
                "video": false,
                "vote_average": 6.61,
                "vote_count": 6524,
                "character": "Jack Reacher",
                "credit_id": "52fe4912c3a368484e11918f",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/i4ZougHEyBAboDpi6jsaTUDTjUl.jpg",
                "genre_ids": [
                    14,
                    53,
                    28,
                    12,
                    27
                ],
                "id": 282035,
                "original_language": "en",
                "original_title": "The Mummy",
                "overview": "Though safely entombed in a crypt deep beneath the unforgiving desert, an ancient queen whose destiny was unjustly taken from her is awakened in our current day, bringing with her malevolence grown over millennia, and terrors that defy human comprehension.",
                "popularity": 45.308,
                "poster_path": "/zxkY8byBnCsXodEYpK8tmwEGXBI.jpg",
                "release_date": "2017-06-06",
                "title": "The Mummy",
                "video": false,
                "vote_average": 5.509,
                "vote_count": 6782,
                "character": "Nick Morton",
                "credit_id": "56b65869925141677c000201",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/ki5RnA0xNOEd3R0RohXqJt9R6Om.jpg",
                "genre_ids": [
                    28,
                    12
                ],
                "id": 177677,
                "original_language": "en",
                "original_title": "Mission: Impossible - Rogue Nation",
                "overview": "Ethan and team take on their most impossible mission yet—eradicating 'The Syndicate', an International and highly-skilled rogue organization committed to destroying the IMF.",
                "popularity": 62.464,
                "poster_path": "/sGvcWcI99OTXLzghD7qXw00KaY5.jpg",
                "release_date": "2015-07-23",
                "title": "Mission: Impossible - Rogue Nation",
                "video": false,
                "vote_average": 7.2,
                "vote_count": 8250,
                "character": "Ethan Hunt",
                "credit_id": "52fe4d8ac3a36847f8266743",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/4V1yIoAKPMRQwGBaSses8Bp2nsi.jpg",
                "genre_ids": [
                    28,
                    878
                ],
                "id": 137113,
                "original_language": "en",
                "original_title": "Edge of Tomorrow",
                "overview": "Major Bill Cage is an officer who has never seen a day of combat when he is unceremoniously demoted and dropped into combat. Cage is killed within minutes, managing to take an alpha alien down with him. He awakens back at the beginning of the same day and is forced to fight and die again... and again - as physical contact with the alien has thrown him into a time loop.",
                "popularity": 51.513,
                "poster_path": "/xjw5trHV7Mwo61P0kCTy8paEkgO.jpg",
                "release_date": "2014-05-27",
                "title": "Edge of Tomorrow",
                "video": false,
                "vote_average": 7.608,
                "vote_count": 12920,
                "character": "Maj. William 'Bill' Cage",
                "credit_id": "52fe4c27c3a368484e1aa209",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/thBankgTBZAM3YkdeeF7fuDvkcD.jpg",
                "genre_ids": [
                    28,
                    35,
                    80,
                    18,
                    53
                ],
                "id": 337170,
                "original_language": "en",
                "original_title": "American Made",
                "overview": "The true story of pilot Barry Seal, who transported contraband for the CIA and the Medellin cartel in the 1980s.",
                "popularity": 27.67,
                "poster_path": "/23ILgoPSO5ShKcTZOuiTVfqFAUB.jpg",
                "release_date": "2017-08-18",
                "title": "American Made",
                "video": false,
                "vote_average": 6.867,
                "vote_count": 4173,
                "character": "Barry Seal",
                "credit_id": "5539f074c3a3683e14000c1f",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg",
                "genre_ids": [
                    28,
                    53
                ],
                "id": 343611,
                "original_language": "en",
                "original_title": "Jack Reacher: Never Go Back",
                "overview": "When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.",
                "popularity": 52.38,
                "poster_path": "/cOg3UT2NYWHZxp41vpxAnVCOC4M.jpg",
                "release_date": "2016-10-19",
                "title": "Jack Reacher: Never Go Back",
                "video": false,
                "vote_average": 5.953,
                "vote_count": 4526,
                "character": "Jack Reacher",
                "credit_id": "5573971c9251413f6600024d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/aw4FOsWr2FY373nKSxbpNi3fz4F.jpg",
                "genre_ids": [
                    28,
                    12
                ],
                "id": 353081,
                "original_language": "en",
                "original_title": "Mission: Impossible - Fallout",
                "overview": "When an IMF mission ends badly, the world is faced with dire consequences. As Ethan Hunt takes it upon himself to fulfill his original briefing, the CIA begin to question his loyalty and his motives. The IMF team find themselves in a race against time, hunted by assassins while trying to prevent a global catastrophe.",
                "popularity": 75.08,
                "poster_path": "/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg",
                "release_date": "2018-07-13",
                "title": "Mission: Impossible - Fallout",
                "video": false,
                "vote_average": 7.418,
                "vote_count": 7605,
                "character": "Ethan Hunt",
                "credit_id": "55f7e528c3a3686d0300cebc",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 62577,
                "original_language": "en",
                "original_title": "Together: The Hendrick Motorsports Story",
                "overview": "NASCAR Media Group's documentary-style film chronicling the history of the eight-time NASCAR Sprint Cup Series championship team. Narrated by three-time Academy Award nominee Tom Cruise, ogether employs exclusive interviews, never-before-seen archival footage, thrilling racing sequences and rare family photography to detail the personal relationships and emotional events that have shaped one of NASCAR's most decorated organizations. Written by Anonymous Narrated by three-time Academy Award nominee Tom Cruise, Together employs exclusive interviews, never-before-seen archival footage, thrilling racing sequences and rare family photography to detail the personal relationships and emotional events that have shaped one of NASCAR's most decorated organizations.",
                "popularity": 2.053,
                "poster_path": null,
                "release_date": "2009-05-18",
                "title": "Together: The Hendrick Motorsports Story",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Narrator (voice)",
                "credit_id": "5a4bcdbc9251415c9b02bc28",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/t461FGnPy3b8wLoJ252CwKycAuv.jpg",
                "genre_ids": [
                    28,
                    12,
                    53
                ],
                "id": 575265,
                "original_language": "en",
                "original_title": "Mission: Impossible 8",
                "overview": "The eighth installment of the Mission: Impossible franchise.",
                "popularity": 49.505,
                "poster_path": "/l2fgb4JU0uLpWTaMFrxPqfQ94Kr.jpg",
                "release_date": "2025-05-22",
                "title": "Mission: Impossible 8",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Ethan Hunt",
                "credit_id": "5c3d2b2a9251416b02acec9f",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/628Dep6AxEtDxjZoGP78TsOxYbK.jpg",
                "genre_ids": [
                    28,
                    53
                ],
                "id": 575264,
                "original_language": "en",
                "original_title": "Mission: Impossible - Dead Reckoning Part One",
                "overview": "Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most.",
                "popularity": 1189.671,
                "poster_path": "/NNxYkU70HPurnNCSiCjYAmacwm.jpg",
                "release_date": "2023-07-08",
                "title": "Mission: Impossible - Dead Reckoning Part One",
                "video": false,
                "vote_average": 7.71,
                "vote_count": 2061,
                "character": "Ethan Hunt",
                "credit_id": "5c3d2ae892514156e5ac7c11",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 565666,
                "original_language": "en",
                "original_title": "Special Delivery: Michael Mann on Making 'Collateral'",
                "overview": "",
                "popularity": 4.729,
                "poster_path": "/t9GDCt32NTkiBxdPxgHPjvPd1Jy.jpg",
                "release_date": "2004-06-07",
                "title": "Special Delivery: Michael Mann on Making 'Collateral'",
                "video": true,
                "vote_average": 7.0,
                "vote_count": 2,
                "character": "Self",
                "credit_id": "5c891eaec3a368216e0abe57",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99,
                    99
                ],
                "id": 615515,
                "original_language": "en",
                "original_title": "Cruise on Kubrick",
                "overview": "Tom Cruise shares his perpective on Stanley Kubrick.",
                "popularity": 1.368,
                "poster_path": null,
                "release_date": "1999-11-19",
                "title": "Cruise on Kubrick",
                "video": false,
                "vote_average": 7.0,
                "vote_count": 4,
                "character": "Self",
                "credit_id": "5d2b74d09653f60011e7677e",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 673205,
                "original_language": "en",
                "original_title": "The Dream is Always the Same: The Story of Risky Business",
                "overview": "Set against the landscape of 80s teen culture and the dawn of yuppiedom, this documentary relishes 'Risky Business' for having the brains to break from convention, while celebrating the film's cultural impact.",
                "popularity": 2.289,
                "poster_path": "/hZORpiJt2LbVEyhHa79x5E7tZbS.jpg",
                "release_date": "2008-09-16",
                "title": "The Dream is Always the Same: The Story of Risky Business",
                "video": false,
                "vote_average": 5.5,
                "vote_count": 2,
                "character": "Self",
                "credit_id": "5e484e91134d580018303909",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/uRokRYuqQZf5v1JJERKhKTmJXLn.jpg",
                "genre_ids": [
                    28,
                    35,
                    99
                ],
                "id": 984430,
                "original_language": "en",
                "original_title": "James Corden's Top Gun Training with Tom Cruise",
                "overview": "When Top Gun: Maveric star Tom Cruise calls you up to hang out for the day, you say yes. And for James Corden, that meant having Tom pilot you in two different fighter planes, pushing the limits of gravity and James's stomach.",
                "popularity": 7.799,
                "poster_path": "/e2EILRtu7b6qu4TuwU7BpyHop68.jpg",
                "release_date": "2022-06-01",
                "title": "James Corden's Top Gun Training with Tom Cruise",
                "video": false,
                "vote_average": 6.1,
                "vote_count": 14,
                "character": "Self",
                "credit_id": "629d4fb67e12f0121293561a",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/AaV1YIdWKnjAIAOe8UUKBFm327v.jpg",
                "genre_ids": [
                    28,
                    18
                ],
                "id": 361743,
                "original_language": "en",
                "original_title": "Top Gun: Maverick",
                "overview": "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
                "popularity": 186.294,
                "poster_path": "/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
                "release_date": "2022-05-24",
                "title": "Top Gun: Maverick",
                "video": false,
                "vote_average": 8.252,
                "vote_count": 7710,
                "character": "Capt. Pete 'Maverick' Mitchell",
                "credit_id": "62a180ad4f9a9900a4cf58f7",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    878,
                    28,
                    12,
                    53
                ],
                "id": 878779,
                "original_language": "en",
                "original_title": "Luna Park",
                "overview": "A group of renegade employees venture to the moon to steal an energy source. Said to be filmed in space at the ISS.",
                "popularity": 2.246,
                "poster_path": null,
                "release_date": "",
                "title": "Luna Park",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "",
                "credit_id": "62b70f6cbc865704537f36ae",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/r0OGNs8auphBzrUK4ZkdSyHSZGy.jpg",
                "genre_ids": [
                    99
                ],
                "id": 1022047,
                "original_language": "en",
                "original_title": "Danger Zone: The Making of Top Gun",
                "overview": "A comprehensive 6-part documentary on the making of Top Gun featuring all-new interviews with the cast and crew. Available on Disc 2 of the Top Gun 2-Disc Special Collector's Edition DVD.",
                "popularity": 1.433,
                "poster_path": "/fhjM1vsPfjIzHsIC2GE1w5RcfCP.jpg",
                "release_date": "2004-05-10",
                "title": "Danger Zone: The Making of Top Gun",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "63195ea8880c92007aeccfdd",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 747321,
                "original_language": "en",
                "original_title": "On Your Six: Thirty Years of Top Gun",
                "overview": "A five-part documentary from 2016, chronicling the legacy of Top Gun.",
                "popularity": 2.104,
                "poster_path": "/zG78aJ6dnh7s23t4UR25I71FNd6.jpg",
                "release_date": "2020-05-19",
                "title": "On Your Six: Thirty Years of Top Gun",
                "video": false,
                "vote_average": 5.8,
                "vote_count": 5,
                "character": "Self",
                "credit_id": "63ac0da4c56d2d00f30d9090",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 1079535,
                "original_language": "en",
                "original_title": "Remembering Stanley Kubrick",
                "overview": "Interviews with Tom Cruise, Nicole Kidman and Steven Spielberg about Stanley Kubrick and Eyes Wide Shut.",
                "popularity": 1.554,
                "poster_path": "/3MGGb8w86h5hR1gZrh8LQHIavOy.jpg",
                "release_date": "1999-01-01",
                "title": "Remembering Stanley Kubrick",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "63d49e053dc31300af210921",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/vcAPhgU9V443XUW3uR2mR3zOuAq.jpg",
                "genre_ids": [
                    99
                ],
                "id": 1133142,
                "original_language": "en",
                "original_title": "Tom Cruise: The Last Movie Star",
                "overview": "Tom Cruise - actor, producer, daredevil. The face of Hollywood in the 1980s, after a mid-career meltdown, his future looked in doubt. But through a single-minded commitment to entertaining audiences worldwide, he has risked life and limb and fought his way back to the very top. In an entertainment world dominated by superheroes and fantasy franchises, he stands alone… the last movie star.",
                "popularity": 5.17,
                "poster_path": "/eykwtACYOMMJdTO40vh70BpreUv.jpg",
                "release_date": "2023-07-28",
                "title": "Tom Cruise: The Last Movie Star",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self (archive footage)",
                "credit_id": "64749d049ae61301257cd95d",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/cvFkYGggoyCeJOJFYCyCNAFtPw0.jpg",
                "genre_ids": [
                    99
                ],
                "id": 1158471,
                "original_language": "en",
                "original_title": "Tom Cruise: Impossible Missions",
                "overview": "The stories behind the most memorable stunts from the film franchise, from the genre-defining Langley Heist to the jaw-dropping Plane Hang",
                "popularity": 3.231,
                "poster_path": "/tT6DnicFZA4ZivTKAlDUWetgO5T.jpg",
                "release_date": "2023-07-08",
                "title": "Tom Cruise: Impossible Missions",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "64c7baa1d7a70a011c7864fb",
                "order": 0
            },
            {
                "adult": false,
                "backdrop_path": "/mrfbeWcjgSaZ9NEb0xJMR9xzSeB.jpg",
                "genre_ids": [
                    18
                ],
                "id": 380,
                "original_language": "en",
                "original_title": "Rain Man",
                "overview": "When car dealer Charlie Babbitt learns that his estranged father has died, he returns home to Cincinnati, where he discovers that he has a savant older brother named Raymond and that his father's $3 million fortune is being left to the mental institution in which Raymond lives. Motivated by his father's money, Charlie checks Raymond out of the facility in order to return with him to Los Angeles. The brothers' cross-country trip ends up changing both their lives.",
                "popularity": 25.296,
                "poster_path": "/iTNHwO896WKkaoPtpMMS74d8VNi.jpg",
                "release_date": "1988-12-12",
                "title": "Rain Man",
                "video": false,
                "vote_average": 7.758,
                "vote_count": 5859,
                "character": "Charlie Babbitt",
                "credit_id": "52fe423cc3a36847f800e8bb",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/poFDHgqiCNSQ5Z1kYMTHbgBMQH4.jpg",
                "genre_ids": [
                    28,
                    12,
                    18,
                    36
                ],
                "id": 4515,
                "original_language": "en",
                "original_title": "Lions for Lambs",
                "overview": "Three stories told simultaneously in ninety minutes of real time: a Republican Senator who's a presidential hopeful gives an hour-long interview to a skeptical television reporter, detailing a strategy for victory in Afghanistan; two special forces ambushed on an Afghani ridge await rescue as Taliban forces close in; a poli-sci professor at a California college invites a student to re-engage.",
                "popularity": 14.329,
                "poster_path": "/rvpxNsR0n4zh40WM6MiUlkV60on.jpg",
                "release_date": "2007-10-22",
                "title": "Lions for Lambs",
                "video": false,
                "vote_average": 6.021,
                "vote_count": 686,
                "character": "Senator Jasper Irving",
                "credit_id": "52fe43c7c3a36847f806f065",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/hhCp6ZLDjS5wUHkGg7k3VGvH3Xm.jpg",
                "genre_ids": [
                    18
                ],
                "id": 11873,
                "original_language": "en",
                "original_title": "The Color of Money",
                "overview": "Former pool hustler Fast Eddie Felson decides he wants to return to the game by taking a pupil. He meets talented but green Vincent Lauria and proposes a partnership. As they tour pool halls, Eddie teaches Vincent the tricks of scamming, but he eventually grows frustrated with Vincent's showboat antics, leading to an argument and a falling-out. Eddie takes up playing again and soon crosses paths with Vincent as an opponent.",
                "popularity": 14.347,
                "poster_path": "/dVdnHmdQu3JtLAAksjTmTEF76gD.jpg",
                "release_date": "1986-10-17",
                "title": "The Color of Money",
                "video": false,
                "vote_average": 6.845,
                "vote_count": 1209,
                "character": "Vincent Lauria",
                "credit_id": "52fe44979251416c7503a3d3",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 291537,
                "original_language": "en",
                "original_title": "Winning: The Racing Life of Paul Newman",
                "overview": "The world knows Paul Newman as an Academy Award winning actor with a fifty-plus year career as one of the most prolific and revered actors in American Cinema. He was also well known for his philanthropy; Newman's Own has given more than four hundred and thirty million dollars to charities around the world. Yet few know the gasoline-fueled passion that became so important in this complex, multifaceted man's makeup. Newman’s deep-seated passion for racing was so intense it nearly sidelined his acting career. His racing career spanned thirty-five years; Newman won four national championships as a driver and eight championships as an owner. Not bad for a guy who didn't even start racing until he was forty-seven years old.",
                "popularity": 3.814,
                "poster_path": "/hsTxEODkmcHvVhR9junDH8I43dt.jpg",
                "release_date": "2015-05-08",
                "title": "Winning: The Racing Life of Paul Newman",
                "video": false,
                "vote_average": 7.455,
                "vote_count": 22,
                "character": "Self",
                "credit_id": "540f3b760e0a2627aa00019e",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/d2Tyhz8E2sen21FF0sDXlrYv4Gt.jpg",
                "genre_ids": [
                    99
                ],
                "id": 517938,
                "original_language": "en",
                "original_title": "The Last Movie: Stanley Kubrick and 'Eyes Wide Shut'",
                "overview": "A documentary chronicling the making of Kubrick's final film, 'Eyes Wide Shut', and his legacy.",
                "popularity": 1.711,
                "poster_path": "/hdmq5bxbY8MsDdkU056RKsswtsX.jpg",
                "release_date": "1999-09-05",
                "title": "The Last Movie: Stanley Kubrick and 'Eyes Wide Shut'",
                "video": false,
                "vote_average": 8.0,
                "vote_count": 6,
                "character": "Self",
                "credit_id": "5ad06ba2c3a368259d0051cc",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 565663,
                "original_language": "en",
                "original_title": "City of Night: The Making of 'Collateral'",
                "overview": "This documentary chronicles the making of the film Collateral (2004). We get to see Tom Cruise and Jamie Foxx training for their roles, as well as Jada Pinket Smith's Audition. Michael Mann also informs us on his preparation for the film, as well as some more behind-the-scenes looks at the 17 special camera-ready taxis and the taxi crash.",
                "popularity": 3.227,
                "poster_path": "/1oFFFrbgU5mqCC4eRap4B1iid6p.jpg",
                "release_date": "2004-12-14",
                "title": "City of Night: The Making of 'Collateral'",
                "video": true,
                "vote_average": 6.0,
                "vote_count": 3,
                "character": "Self",
                "credit_id": "5c674d109251417aa2ff98c8",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 705078,
                "original_language": "en",
                "original_title": "Hitting It Hard",
                "overview": "The press tour to promote the film Vanilla Sky (2001) does quite a number on its stars. We see how tired an actor can get after answering the same questions over and over again at various press junkets and premieres.",
                "popularity": 0.6,
                "poster_path": "/gDQUqhfjiBXC6WO1YlvVgQdsrTU.jpg",
                "release_date": "2002-05-21",
                "title": "Hitting It Hard",
                "video": false,
                "vote_average": 6.0,
                "vote_count": 2,
                "character": "",
                "credit_id": "5ec04e49ae2811001f0192a5",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/9mOXEpXUyzTtmgamjC2jGk3SdNN.jpg",
                "genre_ids": [
                    99
                ],
                "id": 765522,
                "original_language": "en",
                "original_title": "Tom Cruise: An Eternal Youth",
                "overview": "After 40 years, Tom Cruise continues to push the envelope in film. Exposing one's heart to the world through their work is not only risky business, as far as Cruise is concerned, it is the only way to achieve an end that feels complete.",
                "popularity": 4.582,
                "poster_path": "/MQwWS1iBzUkpyjNFV8Je6dFoIU.jpg",
                "release_date": "2020-10-05",
                "title": "Tom Cruise: An Eternal Youth",
                "video": false,
                "vote_average": 6.7,
                "vote_count": 19,
                "character": "Self (archive footage)",
                "credit_id": "5fb42f6d1f0275003f5d23d5",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 149044,
                "original_language": "en",
                "original_title": "Mission: Improbable",
                "overview": "A behind the scenes look at the stunt work of Mission: Impossible , told through one stunt man who looks like a certain superstar, who's got his looks, but certainly not his smarts.",
                "popularity": 2.679,
                "poster_path": "/aJJqTX3aRGcuJCzR8NFOfqN2WhM.jpg",
                "release_date": "2001-06-02",
                "title": "Mission: Improbable",
                "video": false,
                "vote_average": 7.357,
                "vote_count": 14,
                "character": "Self",
                "credit_id": "617045d5abdec00043db7793",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 1045592,
                "original_language": "en",
                "original_title": "Jack Reacher: When the Man Comes Around",
                "overview": "Cast and crew speak on adapting One Shot as the first Jack Reacher film, casting Tom Cruise, earning Lee Child's blessing, additional character qualities and the performances that shape them, Lee Child's cameo in the film, and shooting the film's climax.",
                "popularity": 5.956,
                "poster_path": null,
                "release_date": "2013-05-07",
                "title": "Jack Reacher: When the Man Comes Around",
                "video": false,
                "vote_average": 10.0,
                "vote_count": 1,
                "character": "Self",
                "credit_id": "636991b8ebb99d0079605c7e",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/q9zrhnviRw3xZTQmh8GcGd19Vmq.jpg",
                "genre_ids": [
                    35,
                    10770,
                    99
                ],
                "id": 1121263,
                "original_language": "en",
                "original_title": "The Last Last Late Late Show",
                "overview": "Celebrating the final night of The Late Late Show With James Corden James welcomes guests Tom Cruise and Adele.",
                "popularity": 2.016,
                "poster_path": "/yEMPLJny3hXpCfUn5NUrI5WQngH.jpg",
                "release_date": "2023-04-27",
                "title": "The Last Last Late Late Show",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self - Guest",
                "credit_id": "64519c88105611011c030716",
                "order": 1
            },
            {
                "adult": false,
                "backdrop_path": "/gOTVmzCUmT6qpR8S9E53hqtxx5T.jpg",
                "genre_ids": [
                    18
                ],
                "id": 334,
                "original_language": "en",
                "original_title": "Magnolia",
                "overview": "An epic mosaic of many interrelated characters in search of happiness, forgiveness, and meaning in the San Fernando Valley.",
                "popularity": 25.951,
                "poster_path": "/uq2u8HgtLFJkjNq2kHb2jvipIPT.jpg",
                "release_date": "1999-12-10",
                "title": "Magnolia",
                "video": false,
                "vote_average": 7.73,
                "vote_count": 3261,
                "character": "Frank 'T.J.' Mackey",
                "credit_id": "52fe4239c3a36847f800d689",
                "order": 2
            },
            {
                "adult": false,
                "backdrop_path": "/8GIOzIVMlzV7h7ApmbBbq471kpZ.jpg",
                "genre_ids": [
                    35,
                    18,
                    10402,
                    10749
                ],
                "id": 80585,
                "original_language": "en",
                "original_title": "Rock of Ages",
                "overview": "A small town girl and a city boy meet on the Sunset Strip, while pursuing their Hollywood dreams.",
                "popularity": 18.755,
                "poster_path": "/A0kIZHg0Tn66lw5gbKUIRwlCny0.jpg",
                "release_date": "2012-06-13",
                "title": "Rock of Ages",
                "video": false,
                "vote_average": 6.198,
                "vote_count": 1177,
                "character": "Stacee Jaxx",
                "credit_id": "52fe47c99251416c91075af7",
                "order": 2
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35,
                    99,
                    10402
                ],
                "id": 298339,
                "original_language": "en",
                "original_title": "Time Out: The Truth About HIV, AIDS and You",
                "overview": "Join stars Paula Abdul, Luke Perry, Sinbad, Pauly Shore, Jaleel White and many, many more as they take an entertaining, music-filled and honest look at HIV and AIDS.  You'll get all the latest facts, important dos and don'ts, and you'll meet some wonderful people.  Co-hosts Arsenio Hall and Earvin Magic Johnson even hit the court for a little one-on-one, and then take time out for an informative heart-to-heart!  For people who already know about HIV and AIDS, and for those who don't, TIME OUT is a video you can't afford to miss.",
                "popularity": 1.959,
                "poster_path": null,
                "release_date": "1992-09-10",
                "title": "Time Out: The Truth About HIV, AIDS and You",
                "video": false,
                "vote_average": 3.9,
                "vote_count": 4,
                "character": "Self",
                "credit_id": "5444e6b90e0a26634d007302",
                "order": 2
            },
            {
                "adult": false,
                "backdrop_path": "/a7DCwfYAiIN15qfmFmrLcHh751E.jpg",
                "genre_ids": [
                    28,
                    35,
                    12,
                    10752
                ],
                "id": 7446,
                "original_language": "en",
                "original_title": "Tropic Thunder",
                "overview": "Ben Stiller, Jack Black and Robert Downey Jr. lead an ensemble cast in 'Tropic Thunder,' an action comedy about a group of self-absorbed actors who set out to make the most expensive war film. After ballooning costs force the studio to cancel the movie, the frustrated director refuses to stop shooting, leading his cast into the jungles of Southeast Asia, where they encounter real bad guys.",
                "popularity": 32.461,
                "poster_path": "/zAurB9mNxfYRoVrVjAJJwGV3sPg.jpg",
                "release_date": "2008-08-09",
                "title": "Tropic Thunder",
                "video": false,
                "vote_average": 6.642,
                "vote_count": 5638,
                "character": "Les Grossmann",
                "credit_id": "52fe447dc3a36847f8099301",
                "order": 3
            },
            {
                "adult": false,
                "backdrop_path": "/GqEknYaFIxEYJ7Gu5KK1j1FPBT.jpg",
                "genre_ids": [
                    99,
                    36,
                    10752
                ],
                "id": 639558,
                "original_language": "en",
                "original_title": "Valkyrie: The Plot to Kill Hitler",
                "overview": "Created as a companion documentary to the film Valkyrie this documentary details the true story behind the plot to assassinate Adolph Hitler.",
                "popularity": 5.572,
                "poster_path": "/2IhECkpvia0AXrcaCeflxCwtFOC.jpg",
                "release_date": "2008-11-24",
                "title": "Valkyrie: The Plot to Kill Hitler",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 5,
                "character": "Self",
                "credit_id": "5da5c1f1afe2240018f0f821",
                "order": 3
            },
            {
                "adult": false,
                "backdrop_path": "/yMW5a0hOJn6LdBTNsq3vOJY6MZb.jpg",
                "genre_ids": [
                    10752,
                    18
                ],
                "id": 10627,
                "original_language": "en",
                "original_title": "Taps",
                "overview": "Military cadets take extreme measures to ensure the future of their academy when its existence is threatened by local condo developers.",
                "popularity": 15.414,
                "poster_path": "/6f4qOrzSMUqSc0iAODL6wnwJ7km.jpg",
                "release_date": "1981-12-20",
                "title": "Taps",
                "video": false,
                "vote_average": 6.8,
                "vote_count": 243,
                "character": "Cadet Captain David Shawn",
                "credit_id": "52fe43979251416c7501671f",
                "order": 4
            },
            {
                "adult": false,
                "backdrop_path": "/5nldLwu77WjpvoeQJU426OWCtZ7.jpg",
                "genre_ids": [
                    99
                ],
                "id": 689705,
                "original_language": "fr",
                "original_title": "Kubrick by Kubrick",
                "overview": "A rare and transcendent journey into the life and films of the legendary Stanley Kubrick like we've never seen before, featuring a treasure trove of unearthed interview recordings from the master himself.",
                "popularity": 5.459,
                "poster_path": "/hgmWmo2xBghbWXKK8YpJHSR8n1x.jpg",
                "release_date": "2020-10-22",
                "title": "Kubrick by Kubrick",
                "video": false,
                "vote_average": 7.547,
                "vote_count": 32,
                "character": "Self (archive footage)",
                "credit_id": "5ec2c8224e52ed002137d8f8",
                "order": 4
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 748366,
                "original_language": "en",
                "original_title": "The Golden Hour: Making of Days of Thunder",
                "overview": "An in-depth, two-part documentary by FOX Sports on the making of the 1990 film Days of Thunder a few months after its 30th anniversary. The behind-the-scenes retrospective interviews those involved with the film, NASCAR itself and others in the industry.",
                "popularity": 0.912,
                "poster_path": "/enviX6MxX7G217LICjEFqsTES4E.jpg",
                "release_date": "2020-09-30",
                "title": "The Golden Hour: Making of Days of Thunder",
                "video": false,
                "vote_average": 8.2,
                "vote_count": 4,
                "character": "Self (archive footage)",
                "credit_id": "5f73fe1421621b00342add1f",
                "order": 4
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 833818,
                "original_language": "en",
                "original_title": "Junket Whore",
                "overview": "A documentary film that explores the relationship between publicists and journalists in Hollywood.",
                "popularity": 1.636,
                "poster_path": "/nOjIGu6IWWs91fFOTcfzdPYNtBD.jpg",
                "release_date": "1998-10-12",
                "title": "Junket Whore",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "60af06e350f7ca003f75d1a7",
                "order": 4
            },
            {
                "adult": false,
                "backdrop_path": "/29VoISagzOfJcuuhFzKQg9ZmEUU.jpg",
                "genre_ids": [
                    99
                ],
                "id": 318224,
                "original_language": "en",
                "original_title": "Going Clear: Scientology and the Prison of Belief",
                "overview": "GOING CLEAR intimately profiles eight former members of the Church of Scientology, shining a light on how they attract true believers and the things they do in the name of religion.",
                "popularity": 11.901,
                "poster_path": "/zWHQYR9srde9nZjU6Dot8qTjoni.jpg",
                "release_date": "2015-01-25",
                "title": "Going Clear: Scientology and the Prison of Belief",
                "video": false,
                "vote_average": 7.614,
                "vote_count": 748,
                "character": "Self (archive footage)",
                "credit_id": "55146e02925141070100bb4b",
                "order": 5
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 118483,
                "original_language": "en",
                "original_title": "The Art of Action: Martial Arts in the Movies",
                "overview": "Hosted by Samuel L. Jackson, this in-depth documentary offers viewers a behind-the-scenes look at the history of the martial arts film -- from the genre's rebellious beginnings to high-flying modern epics. Jackson takes you through the best moments of 100 movies, including Charlie's Angels and Oscar winner Crouching Tiger, Hidden Dragon. Interviews with martial arts film veterans Sammo Hung, John Woo and Ang Lee round out the video.",
                "popularity": 2.83,
                "poster_path": "/4z8SUZPEBZaHqpXnINg2aGuJLLU.jpg",
                "release_date": "2002-06-01",
                "title": "The Art of Action: Martial Arts in the Movies",
                "video": false,
                "vote_average": 5.7,
                "vote_count": 11,
                "character": "Self",
                "credit_id": "59543d56c3a36809c6041c7d",
                "order": 5
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99,
                    35
                ],
                "id": 758404,
                "original_language": "en",
                "original_title": "Donald Trump Is President and You're Not: A Portrait of Donald J. Trump",
                "overview": "A phantasmagoric odyssey into the presidency of Donald J. Trump. This film is a collaboration between VICE News and surrealist video artist Vic Berger.",
                "popularity": 3.41,
                "poster_path": "/hAvgHyj1StvfGsVNbO7qkyR3yok.jpg",
                "release_date": "2020-10-28",
                "title": "Donald Trump Is President and You're Not: A Portrait of Donald J. Trump",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self (archival footage)",
                "credit_id": "5f9b81687ac82900385b3492",
                "order": 5
            },
            {
                "adult": false,
                "backdrop_path": "/hpzbQDjl2yzf6MwrYOrbDJCmojc.jpg",
                "genre_ids": [
                    80,
                    18
                ],
                "id": 227,
                "original_language": "en",
                "original_title": "The Outsiders",
                "overview": "When two poor Greasers, Johnny and Ponyboy, are assaulted by a vicious gang, the Socs, and Johnny kills one of the attackers, tension begins to mount between the two rival gangs, setting off a turbulent chain of events.",
                "popularity": 27.765,
                "poster_path": "/iwbbE0xiOuflxE99gESWC2b5Ohc.jpg",
                "release_date": "1983-03-25",
                "title": "The Outsiders",
                "video": false,
                "vote_average": 7.2,
                "vote_count": 1197,
                "character": "Steve Randle",
                "credit_id": "52fe4229c3a36847f8008bed",
                "order": 6
            },
            {
                "adult": false,
                "backdrop_path": "/dqoPH4sRFhBASjrmqgPOasA1ztT.jpg",
                "genre_ids": [
                    99
                ],
                "id": 359871,
                "original_language": "en",
                "original_title": "My Scientology Movie",
                "overview": "Following a long fascination with the religion and with much experience in dealing with eccentric, unpalatable and unexpected human behavior, the beguilingly unassuming Theroux won't take no for an answer when his request to enter the Church's headquarters is turned down. Inspired by the Church's use of filming techniques, and aided by ex-members of the organization, Theroux uses actors to replay some incidents people claim they experienced as members in an attempt to better understand the way it operates. In a bizarre twist, it becomes clear that the Church is also making a film about Louis Theroux.",
                "popularity": 6.26,
                "poster_path": "/mTAZFb79cum6bfU41C96DwMCp6Y.jpg",
                "release_date": "2016-05-05",
                "title": "My Scientology Movie",
                "video": false,
                "vote_average": 6.6,
                "vote_count": 259,
                "character": "Self (archive footage)",
                "credit_id": "608a0a31a6e2d2002ab3fd1c",
                "order": 8
            },
            {
                "adult": false,
                "backdrop_path": "/387qxpPJomtLtN3X55cNS51N1Bx.jpg",
                "genre_ids": [
                    99
                ],
                "id": 253785,
                "original_language": "en",
                "original_title": "Scientologists at War",
                "overview": "Scientologists at War examines the independent Scientology movement and the high level defectors who have publicly renounced their membership from the Church of Scientology.  Marty Rathbun is one of the most senior defectors in Scientology's history. As the former Inspector General of Ethics in the organisation that was created by science fiction writer L Ron Hubbard, Rathbun worked closely with its leader, David Miscavige, and celebrity follower Tom Cruise.  The film provides a rare insider view of the Church of Scientology.",
                "popularity": 3.677,
                "poster_path": "/90MjWGFiUsIkqDKct0tt6q1xtNR.jpg",
                "release_date": "2013-06-17",
                "title": "Scientologists at War",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 5,
                "character": "Self (archive footage)",
                "credit_id": "625baf12d266a20067b1ffad",
                "order": 8
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 1113682,
                "original_language": "en",
                "original_title": "Close Up",
                "overview": "More than 150 silent short films about singers, actors and directors captured during Press Conferences in Cannes, Venice and Berlin, between 1993 and 2002. Presented the first time in 2012 (ten years after the last shooting) in Napoli Film Festival and in 2013 at the Art Institute of California in Santa Ana. An anthropological experiment on the facial expressions of famous people showing the human being aspect. All original footage from Mel Gibson to Peter Jackson, from George Lucas to Catherine Deneuve, from Michael Douglas to Giancarlo Giannini and many others.",
                "popularity": 4.287,
                "poster_path": "/76Wud5jsFJDMpBoRVzwluMZeaa.jpg",
                "release_date": "2012-09-30",
                "title": "Close Up",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self (archive footage)",
                "credit_id": "643b263c8ec4ab0470ae839c",
                "order": 8
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10402
                ],
                "id": 40196,
                "original_language": "en",
                "original_title": "America: A Tribute to Heroes",
                "overview": "A benefit concert and telethon organized by George Clooney and broadcast uninterrupted and commercial-free by the four major television networks just 10 days after the September 11, 2001 attacks on the World Trade Center and The Pentagon to raise money for the victims and their families,",
                "popularity": 4.207,
                "poster_path": "/eesmzTB7mrJhuTOeJ6gSYT6b4aC.jpg",
                "release_date": "2001-09-21",
                "title": "America: A Tribute to Heroes",
                "video": true,
                "vote_average": 6.0,
                "vote_count": 7,
                "character": "Self",
                "credit_id": "59e392f99251410b67000326",
                "order": 9
            },
            {
                "adult": false,
                "backdrop_path": "/ilnsUdkxf6PD9t90W1aBEcR7tRX.jpg",
                "genre_ids": [
                    99
                ],
                "id": 477001,
                "original_language": "en",
                "original_title": "Diana: The Day Britain Cried",
                "overview": "Retrospective documentary marking the 20th anniversary of the funeral of Princess Diana narrated by Kate Winslet.",
                "popularity": 2.079,
                "poster_path": "/ao05KW1gUKK4e4V8WJL1b5C1W3B.jpg",
                "release_date": "2017-08-29",
                "title": "Diana: The Day Britain Cried",
                "video": false,
                "vote_average": 7.0,
                "vote_count": 3,
                "character": "Self (archive footage)",
                "credit_id": "5db46b81d2c0c10016110456",
                "order": 9
            },
            {
                "adult": false,
                "backdrop_path": "/gV2wSIlNMIUxEArKYrTF2NX4tjb.jpg",
                "genre_ids": [
                    99
                ],
                "id": 834027,
                "original_language": "en",
                "original_title": "Val",
                "overview": "For over 40 years Val Kilmer, one of Hollywood’s most mercurial and/or misunderstood actors has been documenting his own life and craft through film and video. He has amassed thousands of hours of footage, from 16mm home movies made with his brothers, to time spent in iconic roles for blockbuster movies like Top Gun, The Doors, Tombstone, and Batman Forever. This raw, wildly original and unflinching documentary reveals a life lived to extremes and a heart-filled, sometimes hilarious look at what it means to be an artist and a complex man.",
                "popularity": 10.297,
                "poster_path": "/vWJKmfmjpkFeTbUGep6t7w5TexA.jpg",
                "release_date": "2021-07-23",
                "title": "Val",
                "video": false,
                "vote_average": 7.037,
                "vote_count": 135,
                "character": "Self (archive footage)",
                "credit_id": "60e6d6deb7d3520075ba81a8",
                "order": 9
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10402,
                    99,
                    10770
                ],
                "id": 1039607,
                "original_language": "en",
                "original_title": "MTV's 10th Anniversary Special",
                "overview": "A special commemorating the 10th anniversary of MTV. Included are performances created for this special by contemporary music artists who have been associated with MTV throughout the years as well as celebrity interviews, animation and a look at MTV around the world.",
                "popularity": 1.794,
                "poster_path": null,
                "release_date": "1991-06-06",
                "title": "MTV's 10th Anniversary Special",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "6356e658c8a2d4007a4fe515",
                "order": 14
            },
            {
                "adult": false,
                "backdrop_path": "/rTl1x2zvz6EqwlkEo8tZ7l1a8e0.jpg",
                "genre_ids": [
                    18,
                    10749
                ],
                "id": 126314,
                "original_language": "hu",
                "original_title": "Final Cut: Hölgyeim és uraim",
                "overview": "A film where anything can happen - the hero and the heroine changes their faces, age, look, names, and so on. The only same thing: The love between man and woman... in an archetypical love story cut from 500 classics from all around the world.",
                "popularity": 5.457,
                "poster_path": "/eoMO14iZVBTILw1BppQu6ZHaJdA.jpg",
                "release_date": "2012-02-04",
                "title": "Final Cut: Ladies and Gentlemen",
                "video": false,
                "vote_average": 7.537,
                "vote_count": 67,
                "character": "(archive footage)",
                "credit_id": "6481b727e375c0011c7e82b3",
                "order": 15
            },
            {
                "adult": false,
                "backdrop_path": "/xlUdrXatEzDS2kk7ZsnyKew4Jx9.jpg",
                "genre_ids": [
                    99
                ],
                "id": 1166245,
                "original_language": "en",
                "original_title": "Parkinson at 50",
                "overview": "Sir Michael Parkinson looks back over his 50 years as a broadcaster, revealing some tricks of the interview trade and remembering some of his favourite encounters.",
                "popularity": 3.713,
                "poster_path": "/cqPxd8mQswtZtrvgLLQ92BUL5cB.jpg",
                "release_date": "2021-08-28",
                "title": "Parkinson at 50",
                "video": false,
                "vote_average": 10.0,
                "vote_count": 1,
                "character": "Self (archival footage)",
                "credit_id": "64de1c3437109700c51de14d",
                "order": 15
            },
            {
                "adult": false,
                "backdrop_path": "/2TgNJKANT9DPENJZf6GHqqRf0QP.jpg",
                "genre_ids": [
                    10749,
                    18
                ],
                "id": 19114,
                "original_language": "en",
                "original_title": "Endless Love",
                "overview": "Parental disapproval of two teenagers wrapped up in a passionate love affair causes a confusion of arson, death and insanity.",
                "popularity": 21.164,
                "poster_path": "/sU9jXtu7dtbAezz5LdrFZSyzztw.jpg",
                "release_date": "1981-07-17",
                "title": "Endless Love",
                "video": false,
                "vote_average": 5.543,
                "vote_count": 188,
                "character": "Billy",
                "credit_id": "52fe47bb9251416c750a39e5",
                "order": 17
            },
            {
                "adult": false,
                "backdrop_path": "/lsTgf0YfoBUUAwm79xDVEpsq3tQ.jpg",
                "genre_ids": [
                    99,
                    35
                ],
                "id": 13007,
                "original_language": "en",
                "original_title": "Religulous",
                "overview": "Commentator-comic Bill Maher plays devil's advocate with religion as he talks to believers about their faith. Traveling around the world, Maher examines the tenets of Christianity, Judaism and Islam and raises questions about homosexuality, proof of Christ's existence, Jewish Sabbath laws, violent Muslim extremists.",
                "popularity": 9.291,
                "poster_path": "/hBv5LCbWxPB8iU77dwurSGMVZ3N.jpg",
                "release_date": "2008-10-01",
                "title": "Religulous",
                "video": false,
                "vote_average": 7.069,
                "vote_count": 539,
                "character": "Self (archive footage)",
                "credit_id": "638fccc3bc8abc00e0d4404a",
                "order": 18
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 1195270,
                "original_language": "en",
                "original_title": "2002://complicated",
                "overview": "A collection of clips from the year 2002 documenting American teenage pop culture.",
                "popularity": 1.508,
                "poster_path": "/sVI8w6Y1dFQ7pUzSX9IXkxCQ8Zb.jpg",
                "release_date": "2023-08-06",
                "title": "2002://complicated",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "6536e4cd1f748b00e222426a",
                "order": 22
            },
            {
                "adult": false,
                "backdrop_path": "/kNReLJnulwlbztjEPIK7mHTZ6DD.jpg",
                "genre_ids": [
                    35,
                    80,
                    878
                ],
                "id": 818,
                "original_language": "en",
                "original_title": "Austin Powers in Goldmember",
                "overview": "The world's most shagadelic spy continues his fight against Dr. Evil. This time, the diabolical doctor and his clone, Mini-Me, team up with a new foe—'70s kingpin Goldmember. While pursuing the team of villains to stop them from world domination, Austin gets help from his dad and an old girlfriend.",
                "popularity": 37.657,
                "poster_path": "/aSNnxSNc7HftXa6EULM4Lq6mUDn.jpg",
                "release_date": "2002-07-26",
                "title": "Austin Powers in Goldmember",
                "video": false,
                "vote_average": 5.999,
                "vote_count": 2869,
                "character": "Tom Cruise / Famous Austin ('Austinpussy')",
                "credit_id": "58c49b6b9251416342003abb",
                "order": 24
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10402,
                    99
                ],
                "id": 25986,
                "original_language": "en",
                "original_title": "Paul McCartney: Back in the U.S.",
                "overview": "In 2002, a 60-year old McCartney refocused the attention on his musicianship, staging a massive live concert in Cleveland, Ohio. The superstar, who went on to form the popular rock group Wings and had several hit records as a solo artist, performs a track list that covers all three phases of his long and prolific career, including the hits Eleanor Rigby, Live And Let Die, Blackbird, The Long And Winding Road, and Mother Nature's Son. In addition to the 30 tunes that McCartney enthusiastically performs, seemingly immune to the ravages of time and aging, BACK IN THE U.S.A LIVE also includes candid behind-the-scenes footage of the rocker backstage and on the road.",
                "popularity": 2.815,
                "poster_path": "/cHWGvRaASmz5RBEQCeEPfej0pEh.jpg",
                "release_date": "2002-11-26",
                "title": "Paul McCartney: Back in the U.S.",
                "video": false,
                "vote_average": 6.4,
                "vote_count": 7,
                "character": "Self",
                "credit_id": "61a464f5d371970093355af0",
                "order": 29
            },
            {
                "adult": false,
                "backdrop_path": "/2l2mf5pGLoBIyFcMQAcMBwPhyN4.jpg",
                "genre_ids": [
                    99
                ],
                "id": 60028,
                "original_language": "fr",
                "original_title": "Ségo et Sarko sont dans un bateau...",
                "overview": "",
                "popularity": 1.79,
                "poster_path": "/8pboFhTZyFfSzaHCtIEgU9CcGJ0.jpg",
                "release_date": "2007-04-04",
                "title": "Ségo et Sarko sont dans un bateau...",
                "video": false,
                "vote_average": 6.0,
                "vote_count": 2,
                "character": "Self (archive footage)",
                "credit_id": "63add34057530e00c480f263",
                "order": 30
            },
            {
                "adult": false,
                "backdrop_path": "/mEdwMxJmkxhIGfHfgcgCByImDtp.jpg",
                "genre_ids": [
                    37,
                    80,
                    28,
                    12
                ],
                "id": 11967,
                "original_language": "en",
                "original_title": "Young Guns",
                "overview": "A group of young gunmen, led by Billy the Kid, become deputies to avenge the murder of the rancher who became their benefactor. But when Billy takes their authority too far, they become the hunted.",
                "popularity": 18.751,
                "poster_path": "/stvh1A3mj8NYyczE7RvwdtDRCo2.jpg",
                "release_date": "1988-02-17",
                "title": "Young Guns",
                "video": false,
                "vote_average": 6.656,
                "vote_count": 828,
                "character": "Henchman Shot off of Roof (uncredited)",
                "credit_id": "6277202f323eba133723a545",
                "order": 32
            },
            {
                "adult": false,
                "backdrop_path": "/5NZQ73eEKtmbvIWXO3GQFxPAQG9.jpg",
                "genre_ids": [
                    10402,
                    99
                ],
                "id": 1123580,
                "original_language": "en",
                "original_title": "The Coronation Concert",
                "overview": "Take That, Lionel Richie, Katy Perry, Andrea Bocelli, Sir Bryn Terfel, Freya Ridings and many more perform live from Windsor Castle in celebration of Their Majesties' coronation.",
                "popularity": 4.792,
                "poster_path": "/a0C9M0R1KOews1gKkAcmE6VPQDX.jpg",
                "release_date": "2023-05-07",
                "title": "The Coronation Concert",
                "video": false,
                "vote_average": 6.0,
                "vote_count": 2,
                "character": "Self",
                "credit_id": "645819ac156cc7017d71fff2",
                "order": 37
            },
            {
                "adult": false,
                "backdrop_path": "/hwZ4GmCkSb6CzJhlyQQAQnfeDWB.jpg",
                "genre_ids": [
                    99,
                    10770
                ],
                "id": 467062,
                "original_language": "en",
                "original_title": "Spielberg",
                "overview": "A documentary on the life and career of one of the most influential film directors of all time, Steven Spielberg.",
                "popularity": 9.751,
                "poster_path": "/2AAvIR2PHoxNITgLDOkXXlWLlua.jpg",
                "release_date": "2017-10-05",
                "title": "Spielberg",
                "video": false,
                "vote_average": 7.572,
                "vote_count": 258,
                "character": "Self",
                "credit_id": "59f976da9251414c2900dd60",
                "order": 49
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99,
                    10770
                ],
                "id": 253639,
                "original_language": "en",
                "original_title": "And the Oscar Goes To...",
                "overview": "The story of the gold-plated statuette that became the film industry's most coveted prize, AND THE OSCAR GOES TO... traces the history of the Academy itself, which began in 1927 when Louis B. Mayer, then head of MGM, led other prominent members of the industry in forming this professional honorary organization. Two years later the Academy began bestowing awards, which were nicknamed Oscar,and quickly came to represent the pinnacle of cinematic achievement.",
                "popularity": 7.74,
                "poster_path": "/rRL4xf3Z6kgLUyb5vbGKErlzP4h.jpg",
                "release_date": "2014-02-01",
                "title": "And the Oscar Goes To...",
                "video": false,
                "vote_average": 7.163,
                "vote_count": 46,
                "character": "Self (archive footage)",
                "credit_id": "5d65a003b3e6270016fd84e2",
                "order": 82
            },
            {
                "adult": false,
                "backdrop_path": "/hXbPyKhuK27Nija6LOBH3aFNd7N.jpg",
                "genre_ids": [
                    99,
                    27
                ],
                "id": 37757,
                "original_language": "en",
                "original_title": "Never Sleep Again: The Elm Street Legacy",
                "overview": "For decades, Freddy Krueger has slashed his way through the dreams of countless youngsters, scaring up over half a billion dollars at the box office across eight terrifying, spectacular films.",
                "popularity": 16.321,
                "poster_path": "/wjo0erw7vqzI3gGfbapCkZjxehV.jpg",
                "release_date": "2010-05-04",
                "title": "Never Sleep Again: The Elm Street Legacy",
                "video": false,
                "vote_average": 7.823,
                "vote_count": 140,
                "character": "Self (archive footage)",
                "credit_id": "6115c3b1151c5c0073262fad",
                "order": 131
            },
            {
                "adult": false,
                "backdrop_path": "/1x8qZSDzqFFth4ijstLEwzHLUOQ.jpg",
                "genre_ids": [
                    99
                ],
                "id": 47813,
                "original_language": "en",
                "original_title": "Waking Sleeping Beauty",
                "overview": "By the mid-1980s, the fabled animation studios of Walt Disney had fallen on hard times. The artists were polarized between newcomers hungry to innovate and old timers not yet ready to relinquish control. These conditions produced a series of box-office flops and pessimistic forecasts: maybe the best days of animation were over. Maybe the public didn't care. Only a miracle or a magic spell could produce a happy ending. Waking Sleeping Beauty is no fairy tale. It's the true story of how Disney regained its magic with a staggering output of hits - Little Mermaid, Beauty and the Beast, Aladdin, The Lion King, and more - over a 10-year period.",
                "popularity": 8.875,
                "poster_path": "/hywGLq5tMOuKwXfOhYUzoqNNAnU.jpg",
                "release_date": "2009-09-05",
                "title": "Waking Sleeping Beauty",
                "video": false,
                "vote_average": 7.201,
                "vote_count": 97,
                "character": "Vincent Lauria (archive footage)",
                "credit_id": "62bcec81ae6f090062e467db",
                "order": 157
            }
        ],
        "crew": [
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 1079535,
                "original_language": "en",
                "original_title": "Remembering Stanley Kubrick",
                "overview": "Interviews with Tom Cruise, Nicole Kidman and Steven Spielberg about Stanley Kubrick and Eyes Wide Shut.",
                "popularity": 1.554,
                "poster_path": "/3MGGb8w86h5hR1gZrh8LQHIavOy.jpg",
                "release_date": "1999-01-01",
                "title": "Remembering Stanley Kubrick",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "credit_id": "63d49fc922df2e00b2084d0c",
                "department": "Crew",
                "job": "Thanks"
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    18,
                    80,
                    9648,
                    53
                ],
                "id": 1160215,
                "original_language": "en",
                "original_title": "The Frightening Frammis",
                "overview": "When we meet the anti-hero, grifter Mitch Allison, he is disheveled and walking by the side of the road. He tells in a flash back narrative how he stole $25,000 from his con-artist wife Bette and jumped on a train hoping to double the money in a gambling scam. Later, he meets sultry Babe and gets involved in more than he bargained for. The twists and turns never stop in this fast paced fatalistic and humorous tale.",
                "popularity": 3.133,
                "poster_path": "/g5Mca0qb293jIt7uRgoys8OnWzT.jpg",
                "release_date": "1993-09-05",
                "title": "The Frightening Frammis",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "credit_id": "64cc53d143cd5400e27cc29c",
                "department": "Directing",
                "job": "Director"
            },
            {
                "adult": false,
                "backdrop_path": "/mxlXUzriCrR51C1o4gSJalU1NNk.jpg",
                "genre_ids": [
                    18,
                    28,
                    10752
                ],
                "id": 616,
                "original_language": "en",
                "original_title": "The Last Samurai",
                "overview": "Nathan Algren is an American hired to instruct the Japanese army in the ways of modern warfare, which finds him learning to respect the samurai and the honorable principles that rule them. Pressed to destroy the samurai's way of life in the name of modernization and open trade, Algren decides to become an ultimate warrior himself and to fight for their right to exist.",
                "popularity": 42.865,
                "poster_path": "/lsasOSgYI85EHygtT5SvcxtZVYT.jpg",
                "release_date": "2003-12-05",
                "title": "The Last Samurai",
                "video": false,
                "vote_average": 7.575,
                "vote_count": 6349,
                "credit_id": "52fe425ec3a36847f8018e1f",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/sjcPWJ5TXgFglsoixNxyZRyEUq3.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 956,
                "original_language": "en",
                "original_title": "Mission: Impossible III",
                "overview": "Retired from active duty, and training recruits for the Impossible Mission Force, agent Ethan Hunt faces the toughest foe of his career: Owen Davian, an international broker of arms and information, who is as cunning as he is ruthless. Davian emerges to threaten Hunt and all that he holds dear -- including the woman Hunt loves.",
                "popularity": 57.167,
                "poster_path": "/3VianLpu8hhmq4TTItKPaCtA5su.jpg",
                "release_date": "2006-04-25",
                "title": "Mission: Impossible III",
                "video": false,
                "vote_average": 6.724,
                "vote_count": 6257,
                "credit_id": "52fe4293c3a36847f8029707",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/24DZfupDlhXeTchmcOkoGRhP5Vg.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 955,
                "original_language": "en",
                "original_title": "Mission: Impossible II",
                "overview": "With computer genius Luther Stickell at his side and a beautiful thief on his mind, agent Ethan Hunt races across Australia and Spain to stop a former IMF agent from unleashing a genetically engineered biological weapon called Chimera. This mission, should Hunt choose to accept it, plunges him into the center of an international crisis of terrifying magnitude.",
                "popularity": 49.752,
                "poster_path": "/7us8nE3ldE0gX2cziUz4tKg0Go0.jpg",
                "release_date": "2000-05-24",
                "title": "Mission: Impossible II",
                "video": false,
                "vote_average": 6.118,
                "vote_count": 6195,
                "credit_id": "52fe4293c3a36847f80295bf",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/sra8XnL96OyLHENcglmZJg6HA8z.jpg",
                "genre_ids": [
                    12,
                    28,
                    53
                ],
                "id": 954,
                "original_language": "en",
                "original_title": "Mission: Impossible",
                "overview": "When Ethan Hunt, the leader of a crack espionage team whose perilous operation has gone awry with no explanation, discovers that a mole has penetrated the CIA, he's surprised to learn that he's the No. 1 suspect. To clear his name, Hunt now must ferret out the real double agent and, in the process, even the score.",
                "popularity": 77.964,
                "poster_path": "/l5uxY5m5OInWpcExIpKG6AR3rgL.jpg",
                "release_date": "1996-05-22",
                "title": "Mission: Impossible",
                "video": false,
                "vote_average": 6.969,
                "vote_count": 8179,
                "credit_id": "52fe4292c3a36847f80294b1",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/eGzzbfmnXMaa4LZnJVquP1llZ2R.jpg",
                "genre_ids": [
                    9648,
                    878,
                    10749,
                    14,
                    53,
                    18
                ],
                "id": 1903,
                "original_language": "en",
                "original_title": "Vanilla Sky",
                "overview": "David Aames has it all: wealth, good looks and gorgeous women on his arm. But just as he begins falling for the warmhearted Sofia, his face is horribly disfigured in a car accident. That's just the beginning of his troubles as the lines between illusion and reality, between life and death, are blurred.",
                "popularity": 30.559,
                "poster_path": "/l1MBK6BUkZtjEqceEMubDUtvvK3.jpg",
                "release_date": "2001-12-10",
                "title": "Vanilla Sky",
                "video": false,
                "vote_average": 6.814,
                "vote_count": 3839,
                "credit_id": "52fe4320c3a36847f803c339",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/y5hbHJbERDFurustaqcVamN84Y0.jpg",
                "genre_ids": [
                    27,
                    9648,
                    53
                ],
                "id": 1933,
                "original_language": "en",
                "original_title": "The Others",
                "overview": "Grace is a religious woman who lives in an old house kept dark because her two children, Anne and Nicholas, have a rare sensitivity to light. When the family begins to suspect the house is haunted, Grace fights to protect her children at any cost in the face of strange events and disturbing visions.",
                "popularity": 35.893,
                "poster_path": "/p8g1vlTvpM6nr2hMMiZ1fUlKF0D.jpg",
                "release_date": "2001-08-02",
                "title": "The Others",
                "video": false,
                "vote_average": 7.611,
                "vote_count": 5987,
                "credit_id": "52fe4323c3a36847f803d391",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/qykc21PjbISZCmpKedY76fojV1I.jpg",
                "genre_ids": [
                    10749,
                    18
                ],
                "id": 1967,
                "original_language": "en",
                "original_title": "Ask the Dust",
                "overview": "Mexican beauty Camilla hopes to rise above her station by marrying a wealthy American. That is complicated by meeting Arturo Bandini, a first-generation Italian hoping to land a writing career and a blue-eyed blonde on his arm.",
                "popularity": 9.4,
                "poster_path": "/iuJZyJNiQxnmMBBqu40mF0a2nuv.jpg",
                "release_date": "2006-02-02",
                "title": "Ask the Dust",
                "video": false,
                "vote_average": 5.332,
                "vote_count": 134,
                "credit_id": "52fe4327c3a36847f803e5d9",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/poFDHgqiCNSQ5Z1kYMTHbgBMQH4.jpg",
                "genre_ids": [
                    28,
                    12,
                    18,
                    36
                ],
                "id": 4515,
                "original_language": "en",
                "original_title": "Lions for Lambs",
                "overview": "Three stories told simultaneously in ninety minutes of real time: a Republican Senator who's a presidential hopeful gives an hour-long interview to a skeptical television reporter, detailing a strategy for victory in Afghanistan; two special forces ambushed on an Afghani ridge await rescue as Taliban forces close in; a poli-sci professor at a California college invites a student to re-engage.",
                "popularity": 14.329,
                "poster_path": "/rvpxNsR0n4zh40WM6MiUlkV60on.jpg",
                "release_date": "2007-10-22",
                "title": "Lions for Lambs",
                "video": false,
                "vote_average": 6.021,
                "vote_count": 686,
                "credit_id": "52fe43c7c3a36847f806f093",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/vaj9wNfVLXSpBenTnxLIjkTRfJ3.jpg",
                "genre_ids": [
                    80,
                    18,
                    53,
                    9648
                ],
                "id": 11022,
                "original_language": "en",
                "original_title": "Narc",
                "overview": "When the trail goes cold on a murder investigation of a policeman, an undercover narcotics officer is lured back to the force to help solve the case.",
                "popularity": 10.569,
                "poster_path": "/uGHFyVdMQKvIXlsLAoXa5nOUGF.jpg",
                "release_date": "2002-01-14",
                "title": "Narc",
                "video": false,
                "vote_average": 6.692,
                "vote_count": 466,
                "credit_id": "52fe43e59251416c7502243d",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/u4OUSKeFwuP1z42dL58Mi0LYwIg.jpg",
                "genre_ids": [
                    18,
                    36
                ],
                "id": 13537,
                "original_language": "en",
                "original_title": "Shattered Glass",
                "overview": "The true story of fraudulent Washington, D.C. journalist Stephen Glass, who rose to meteoric heights as a young writer in his 20s, becoming a staff writer at The New Republic for three years. Looking for a short cut to fame, Glass concocted sources, quotes and even entire stories, but his deception did not go unnoticed forever, and eventually, his world came crumbling down.",
                "popularity": 12.956,
                "poster_path": "/1KHHNkrf8t15sXXF9d9TGq1T9jv.jpg",
                "release_date": "2003-11-14",
                "title": "Shattered Glass",
                "video": false,
                "vote_average": 6.976,
                "vote_count": 382,
                "credit_id": "52fe45779251416c750578b3",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg",
                "genre_ids": [
                    80,
                    18,
                    53,
                    28
                ],
                "id": 75780,
                "original_language": "en",
                "original_title": "Jack Reacher",
                "overview": "When a gunman takes five lives with six shots, all evidence points to the suspect in custody. On interrogation, the suspect offers up a single note: Get Jack Reacher! So begins an extraordinary chase for the truth, pitting Jack Reacher against an unexpected enemy, with a skill for violence and a secret to keep.",
                "popularity": 65.423,
                "poster_path": "/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg",
                "release_date": "2012-12-20",
                "title": "Jack Reacher",
                "video": false,
                "vote_average": 6.61,
                "vote_count": 6524,
                "credit_id": "52fe4912c3a368484e1191b7",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/ih4lZkUpmSE7AP3maymiO72xJ1z.jpg",
                "genre_ids": [
                    28,
                    53,
                    12
                ],
                "id": 56292,
                "original_language": "en",
                "original_title": "Mission: Impossible - Ghost Protocol",
                "overview": "Ethan Hunt and his team are racing against time to track down a dangerous terrorist named Hendricks, who has gained access to Russian nuclear launch codes and is planning a strike on the United States. An attempt to stop him ends in an explosion causing severe destruction to the Kremlin and the IMF to be implicated in the bombing, forcing the President to disavow them. No longer being aided by the government, Ethan and his team chase Hendricks around the globe, although they might still be too late to stop a disaster.",
                "popularity": 89.37,
                "poster_path": "/psiWp3VTjznfokmGQG9uqiiknQQ.jpg",
                "release_date": "2011-12-07",
                "title": "Mission: Impossible - Ghost Protocol",
                "video": false,
                "vote_average": 7.072,
                "vote_count": 9290,
                "credit_id": "53563fb00e0a262861002dd0",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/ki5RnA0xNOEd3R0RohXqJt9R6Om.jpg",
                "genre_ids": [
                    28,
                    12
                ],
                "id": 177677,
                "original_language": "en",
                "original_title": "Mission: Impossible - Rogue Nation",
                "overview": "Ethan and team take on their most impossible mission yet—eradicating 'The Syndicate', an International and highly-skilled rogue organization committed to destroying the IMF.",
                "popularity": 62.464,
                "poster_path": "/sGvcWcI99OTXLzghD7qXw00KaY5.jpg",
                "release_date": "2015-07-23",
                "title": "Mission: Impossible - Rogue Nation",
                "video": false,
                "vote_average": 7.2,
                "vote_count": 8250,
                "credit_id": "550eff2dc3a3681db2009b3d",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/aw4FOsWr2FY373nKSxbpNi3fz4F.jpg",
                "genre_ids": [
                    28,
                    12
                ],
                "id": 353081,
                "original_language": "en",
                "original_title": "Mission: Impossible - Fallout",
                "overview": "When an IMF mission ends badly, the world is faced with dire consequences. As Ethan Hunt takes it upon himself to fulfill his original briefing, the CIA begin to question his loyalty and his motives. The IMF team find themselves in a race against time, hunted by assassins while trying to prevent a global catastrophe.",
                "popularity": 75.08,
                "poster_path": "/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg",
                "release_date": "2018-07-13",
                "title": "Mission: Impossible - Fallout",
                "video": false,
                "vote_average": 7.418,
                "vote_count": 7605,
                "credit_id": "55f7e54dc3a3680a0d00d696",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg",
                "genre_ids": [
                    28,
                    53
                ],
                "id": 343611,
                "original_language": "en",
                "original_title": "Jack Reacher: Never Go Back",
                "overview": "When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.",
                "popularity": 52.38,
                "poster_path": "/cOg3UT2NYWHZxp41vpxAnVCOC4M.jpg",
                "release_date": "2016-10-19",
                "title": "Jack Reacher: Never Go Back",
                "video": false,
                "vote_average": 5.953,
                "vote_count": 4526,
                "credit_id": "55fdcfa7c3a368133400196b",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/AaV1YIdWKnjAIAOe8UUKBFm327v.jpg",
                "genre_ids": [
                    28,
                    18
                ],
                "id": 361743,
                "original_language": "en",
                "original_title": "Top Gun: Maverick",
                "overview": "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
                "popularity": 186.294,
                "poster_path": "/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
                "release_date": "2022-05-24",
                "title": "Top Gun: Maverick",
                "video": false,
                "vote_average": 8.252,
                "vote_count": 7710,
                "credit_id": "5925e1059251413ba0013182",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/cx2nwab4wKPpmQ9uacgBU7jJfEp.jpg",
                "genre_ids": [
                    35,
                    18,
                    10749
                ],
                "id": 9621,
                "original_language": "en",
                "original_title": "Elizabethtown",
                "overview": "Drew Baylor is fired after causing his shoe company to lose hundreds of millions of dollars. To make matters worse, he's also dumped by his girlfriend. On the verge of ending it all, Drew gets a new lease on life when he returns to his family's small Kentucky hometown after his father dies. Along the way, he meets a flight attendant with whom he falls in love.",
                "popularity": 13.264,
                "poster_path": "/mOdlzAQxhMgiaazRzif1YtJzg9s.jpg",
                "release_date": "2005-10-14",
                "title": "Elizabethtown",
                "video": false,
                "vote_average": 6.173,
                "vote_count": 1000,
                "credit_id": "59f3ae52c3a368719f01b1af",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/tUHrHmhWjgkoIJ6eIFTgrRl8ZqS.jpg",
                "genre_ids": [
                    80,
                    53
                ],
                "id": 8080,
                "original_language": "en",
                "original_title": "Suspect Zero",
                "overview": "A killer is on the loose, and an FBI agent sifts through clues and learns that the bloodthirsty felon's victims of choice are other serial killers.",
                "popularity": 9.533,
                "poster_path": "/h2eTBSstudTj1hrQx3kA3jDjtVi.jpg",
                "release_date": "2004-08-27",
                "title": "Suspect Zero",
                "video": false,
                "vote_average": 5.549,
                "vote_count": 287,
                "credit_id": "59f3ae3392514122c101b429",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/vJxNkmttFOCh2cqAe8iL6WKpoU.jpg",
                "genre_ids": [
                    18,
                    10749
                ],
                "id": 22256,
                "original_language": "en",
                "original_title": "Without Limits",
                "overview": "The film follows the life of famous 1970s runner Steve Prefontaine from his youth days in Oregon to the University of Oregon where he worked with the legendary coach Bill Bowerman, later to Olympics in Munich and his early death at 24 in a car crash.",
                "popularity": 7.174,
                "poster_path": "/obQRdZg693lLh0I2vyc2jlP2PJV.jpg",
                "release_date": "1998-09-11",
                "title": "Without Limits",
                "video": false,
                "vote_average": 6.414,
                "vote_count": 64,
                "credit_id": "59f3ae14925141223b01c164",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/t461FGnPy3b8wLoJ252CwKycAuv.jpg",
                "genre_ids": [
                    28,
                    12,
                    53
                ],
                "id": 575265,
                "original_language": "en",
                "original_title": "Mission: Impossible 8",
                "overview": "The eighth installment of the Mission: Impossible franchise.",
                "popularity": 49.505,
                "poster_path": "/l2fgb4JU0uLpWTaMFrxPqfQ94Kr.jpg",
                "release_date": "2025-05-22",
                "title": "Mission: Impossible 8",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "credit_id": "5c3d2b1b0e0a2655c48e53c4",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/628Dep6AxEtDxjZoGP78TsOxYbK.jpg",
                "genre_ids": [
                    28,
                    53
                ],
                "id": 575264,
                "original_language": "en",
                "original_title": "Mission: Impossible - Dead Reckoning Part One",
                "overview": "Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most.",
                "popularity": 1189.671,
                "poster_path": "/NNxYkU70HPurnNCSiCjYAmacwm.jpg",
                "release_date": "2023-07-08",
                "title": "Mission: Impossible - Dead Reckoning Part One",
                "video": false,
                "vote_average": 7.71,
                "vote_count": 2061,
                "credit_id": "5c3d2a7e0e0a2646a28ddd97",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    878,
                    28,
                    12,
                    53
                ],
                "id": 878779,
                "original_language": "en",
                "original_title": "Luna Park",
                "overview": "A group of renegade employees venture to the moon to steal an energy source. Said to be filmed in space at the ISS.",
                "popularity": 2.246,
                "poster_path": null,
                "release_date": "",
                "title": "Luna Park",
                "video": false,
                "vote_average": 0.0,
                "vote_count": 0,
                "credit_id": "61522445af58cb006537c157",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 705078,
                "original_language": "en",
                "original_title": "Hitting It Hard",
                "overview": "The press tour to promote the film Vanilla Sky (2001) does quite a number on its stars. We see how tired an actor can get after answering the same questions over and over again at various press junkets and premieres.",
                "popularity": 0.6,
                "poster_path": "/gDQUqhfjiBXC6WO1YlvVgQdsrTU.jpg",
                "release_date": "2002-05-21",
                "title": "Hitting It Hard",
                "video": false,
                "vote_average": 6.0,
                "vote_count": 2,
                "credit_id": "63a5ceecbefd91008c7ddf01",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "backdrop_path": "/7iXHBVKPPCO19yHHnHjL0D16i4e.jpg",
                "genre_ids": [
                    12,
                    28,
                    18
                ],
                "id": 2119,
                "original_language": "en",
                "original_title": "Days of Thunder",
                "overview": "Talented but unproven stock car driver Cole Trickle gets a break and with the guidance of veteran Harry Hogge turns heads on the track. The young hotshot develops a rivalry with a fellow racer that threatens his career when the two smash their cars. But with the help of his doctor, Cole just might overcome his injuries-- and his fear.",
                "popularity": 28.781,
                "poster_path": "/4kHzXHRJGcRxxRvkCvb5yTxZwml.jpg",
                "release_date": "1990-06-27",
                "title": "Days of Thunder",
                "video": false,
                "vote_average": 6.352,
                "vote_count": 1328,
                "credit_id": "6295f35adf86a834e2335eac",
                "department": "Writing",
                "job": "Writer"
            }
        ]
    },
    "tv_credits": {
        "cast": [
            {
                "adult": false,
                "backdrop_path": "/vDwYxbJwIB9hCYZeSiweQCxTWNs.jpg",
                "genre_ids": [
                    10763
                ],
                "id": 1514,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "The One Show",
                "overview": "A topical magazine-style daily television programme broadcast live on BBC One and BBC One HD. The programme is currently hosted by Alex Jones and Matt Baker from Monday-Thursday, with Chris Evans appearing instead of Baker on Fridays and relief presenters appearing when required.",
                "popularity": 309.762,
                "poster_path": "/qCOlMsNSMDF5ZSvyzLJnFCqehkZ.jpg",
                "first_air_date": "2006-08-14",
                "name": "The One Show",
                "vote_average": 5.2,
                "vote_count": 20,
                "character": "Self",
                "credit_id": "52570aee760ee3776a05f853",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/6LFqVT02WaNq3q3FlU7dAmt6X5A.jpg",
                "genre_ids": [
                    10767
                ],
                "id": 2221,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The View",
                "overview": "ABC Daytime's morning chatfest, currently featuring Whoopi Goldberg, Joy Behar, Sunny Hostin, Meghan McCain, and Abby Huntsman, discussing the most exciting events of the day. Hot topics in the news, the best experts in their field, celebrity interviews and general entertainment are all part of The View.",
                "popularity": 283.781,
                "poster_path": "/zn5ZtKXYo8XOoXUgtQxw7q2CjVt.jpg",
                "first_air_date": "1997-08-11",
                "name": "The View",
                "vote_average": 4.6,
                "vote_count": 85,
                "character": "Self",
                "credit_id": "52572836760ee3776a28e080",
                "episode_count": 4
            },
            {
                "adult": false,
                "backdrop_path": "/lWkfSWJstUFk7oqyo7MrMoXehoi.jpg",
                "genre_ids": [
                    10767,
                    35
                ],
                "id": 2518,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Tonight Show with Jay Leno",
                "overview": "The Tonight Show with Jay Leno is an American late-night talk show hosted by Jay Leno that initially aired from May 25, 1992 to May 29, 2009, and resumed production on March 1, 2010. The fourth incarnation of the Tonight Show franchise made its debut on May 25, 1992, three days following Johnny Carson's retirement as host of the program. The program originates from NBC Studios in Burbank, California, and is broadcast Monday through Friday at 11:35 PM in the Eastern and Pacific time zones. Unlike Carson or his predecessor Jack Paar, Leno only once utilized a guest host, preferring to host the series by himself.\n\nOn April 26, 1999, the show began broadcasting in 1080i HDTV, becoming the first American nightly talk show to be shot in high definition. The show is shot in 16:9 aspect ratio.\n\nThe series, which followed the same basic format as that of his predecessors, ran until May 29, 2009, after which Leno was succeeded by Conan O'Brien. NBC signed Leno to a new deal for a nightly talk show in the 10:00 pm ET timeslot. The primetime series, titled The Jay Leno Show, debuted on September 14, 2009, following a similar format to the Leno incarnation of Tonight.",
                "popularity": 213.233,
                "poster_path": "/xAFMZ3wFIEXTISryRZD94AAvWng.jpg",
                "first_air_date": "1992-05-25",
                "name": "The Tonight Show with Jay Leno",
                "vote_average": 5.455,
                "vote_count": 76,
                "character": "",
                "credit_id": "52573b68760ee36aaa015063",
                "episode_count": 2
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35,
                    10767
                ],
                "id": 2797,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Web Junk 20",
                "overview": "Web Junk 20 is an American television program in which Vh1 and iFilm collaborate to highlight the twenty funniest and most interesting clips collected from the Internet that week. The show is now hosted by comedian Aries Spears. Patrice O'Neal hosted the first two seasons, while Jim Breuer hosted Season 3. Rachel Perry introduces the premise of each clip via voice-over.\n\nSeason 3 of the show introduced credit given to websites the clips are taken from. Previous seasons of the show would only introduce the clips, but website addresses from sites such as ebaumsworld.com or break.com could clearly be seen in the clips.",
                "popularity": 14.961,
                "poster_path": null,
                "first_air_date": "2006-01-13",
                "name": "Web Junk 20",
                "vote_average": 9.3,
                "vote_count": 40,
                "character": "",
                "credit_id": "525744a5760ee36aaa0ed98f",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10763,
                    99
                ],
                "id": 10946,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Celebrities Uncensored",
                "overview": "Celebrities Uncensored is a TV program on the E! network that edited together amusing paparazzi footage of celebrities, usually in public places such as public sidewalks, restaurants, nightclubs, etc. The celebrities were often friendly, but sometimes their more unfriendly antics were featured in an amusing and entertaining way. It was very popular with stars on the rise and created a stir in the Hollywood community. Paris Hilton was first brought to the public's attention by this show.",
                "popularity": 12.475,
                "poster_path": "/cwZ6ZXREDPOtsAiAUcA4uKBhy1e.jpg",
                "first_air_date": "2003-06-04",
                "name": "Celebrities Uncensored",
                "vote_average": 2.5,
                "vote_count": 4,
                "character": "Self",
                "credit_id": "5258094519c29531db3e2dbc",
                "episode_count": 2
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [],
                "id": 27102,
                "origin_country": [
                    "NL"
                ],
                "original_language": "en",
                "original_name": "Van Der Vorst Ziet Sterren",
                "overview": "",
                "popularity": 9.777,
                "poster_path": null,
                "first_air_date": "2009-01-16",
                "name": "Van Der Vorst Ziet Sterren",
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "",
                "credit_id": "525883ca760ee34661428a98",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10763
                ],
                "id": 27511,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "GMTV",
                "overview": "GMTV is the name of the national Channel 3 breakfast television contractor/licensee, broadcasting in the United Kingdom from 1 January 1993 to 3 September 2010. It became a wholly owned subsidiary of ITV plc in November 2009. Shortly after, ITV plc announced the programme would end. The final edition of GMTV was broadcast on 3 September 2010.",
                "popularity": 85.824,
                "poster_path": "/peQ3blnogd6YXfjqPJOwMx1yOVK.jpg",
                "first_air_date": "1993-01-01",
                "name": "GMTV",
                "vote_average": 7.286,
                "vote_count": 7,
                "character": "Self",
                "credit_id": "525886d0760ee3466147c840",
                "episode_count": 4
            },
            {
                "adult": false,
                "backdrop_path": "/cvwKsMZoaJOsdVuQXAvGODbnTUz.jpg",
                "genre_ids": [
                    10767
                ],
                "id": 217,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Inside the Actors Studio",
                "overview": "James Lipton sits down with some of the world's most accomplished actors and directors for penetrating, fascinating interviews.",
                "popularity": 6.446,
                "poster_path": "/a6O7gKJQe5HWaMujYvdMYaj9PnO.jpg",
                "first_air_date": "1994-06-01",
                "name": "Inside the Actors Studio",
                "vote_average": 7.453,
                "vote_count": 43,
                "character": "Self",
                "credit_id": "5253464219c29579400cbd38",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/48owQZcn8kP6Gfq2IQ7vPFmvKYu.jpg",
                "genre_ids": [
                    35,
                    10767
                ],
                "id": 562,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Ellen DeGeneres Show",
                "overview": "The Ellen DeGeneres Show, often shortened to just Ellen, is an American television talk show hosted by comedian/actress Ellen DeGeneres.",
                "popularity": 165.51,
                "poster_path": "/PhUYIGUUk1RzWq2Aw3TqH65McE.jpg",
                "first_air_date": "2003-09-08",
                "name": "The Ellen DeGeneres Show",
                "vote_average": 5.766,
                "vote_count": 145,
                "character": "Self",
                "credit_id": "5253874c19c29579402198df",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/vcVOtGnGA4NkCBFbKEvlBD226c8.jpg",
                "genre_ids": [
                    10763
                ],
                "id": 742,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Primetime",
                "overview": "Primetime is an American news magazine show which debuted on ABC in 1989 with co-hosts Sam Donaldson and Diane Sawyer and originally had the title Primetime Live.",
                "popularity": 7.388,
                "poster_path": "/3ne3uDf9kPpN6DO9lJDBD7lF7eI.jpg",
                "first_air_date": "1989-08-03",
                "name": "Primetime",
                "vote_average": 1.0,
                "vote_count": 1,
                "character": "",
                "credit_id": "525392e319c29579402a7e0c",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35
                ],
                "id": 1793,
                "origin_country": [
                    "AU"
                ],
                "original_language": "en",
                "original_name": "The Chaser's War on Everything",
                "overview": "The Chaser's War on Everything was an Australian television satirical comedy series broadcast on the Australian Broadcasting Corporation television station ABC1. It has won an Australian Film Institute Award for Best Television Comedy Series. The cast perform sketches mocking social and political issues, and often feature comedic publicity stunts. The series is produced by the Australian satirical group, The Chaser, consisting of Chris Taylor, Julian Morrow, Craig Reucassel, Andrew Hansen, and Chas Licciardello. Fellow Chaser members Dominic Knight and Charles Firth are not part of the regular on-screen cast. However, Knight is a writer, and Firth compiled roving reports for the show from the United States, until he left the group to start a satirical newspaper in mid-2007.\n\nThe show premiered on 17 February 2006 and has since produced 58 episodes, broadcast over three seasons between 2006 to 2007 as well as during 2009. The first season was broadcast at an unstable late timeslot on Friday nights. The second and third seasons were broadcast in a more favourable timeslot of Wednesdays at 9 pm. The show did not return in 2008, but returned on 27 May 2009 for the third season featuring only ten episodes. Following the controversy of the Make a Realistic Wish Foundation sketch, the third season was reduced to 8 episodes, being suspended for 2 weeks.",
                "popularity": 10.043,
                "poster_path": "/3kXEffcnUMbf0YtJtUE6o1CxZhC.jpg",
                "first_air_date": "2006-02-17",
                "name": "The Chaser's War on Everything",
                "vote_average": 7.3,
                "vote_count": 3,
                "character": "",
                "credit_id": "52571571760ee3776a132195",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10763
                ],
                "id": 3167,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Early Show",
                "overview": "The Early Show is an American morning television show which was broadcast by CBS from New York City from 1999 to 2012. The program aired live from 7 to 9 a.m. Eastern Time Monday through Friday in the Eastern time zone; most affiliates in the Central, Mountain, and Pacific time zones aired the show on tape-delay from 7 to 9 a.m. local time. The Saturday edition aired live from 7 to 9 a.m. Eastern Time as well, but a number of affiliates did not carry it or aired it later on tape-delay. It premiered on November 1, 1999, and was the newest of the major networks' morning shows, although CBS has made several attempts to program in the morning slot since 1954. The show aired as a division of CBS News.\n\nThe Early Show, like many of its predecessors, traditionally ran last in the ratings to its rivals, NBC's Today and ABC's Good Morning America. Much like NBC's The Today Show and The Tonight Show, the title The Early Show was analogous to that of CBS's late-night talk show, The Late Show.\n\nOn November 15, 2011, CBS announced that a new morning show would replace The Early Show on January 9, 2012. CBS News chairman Jeff Fager and CBS News president David Rhodes stated that the new show would redefine the morning television landscape. On December 1, it was announced that the new show would be titled CBS This Morning. The Early Show ended its twelve-year run on January 6, 2012, to make way for the program. Charlie Rose, Gayle King, and Erica Hill were named anchors of the new program.",
                "popularity": 16.551,
                "poster_path": "/iJvwr7kL0Q7BtrYC38KQ5baPw7g.jpg",
                "first_air_date": "1999-11-01",
                "name": "The Early Show",
                "vote_average": 7.2,
                "vote_count": 4,
                "character": "Self - Guest",
                "credit_id": "52574d76760ee36aaa16a0c8",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/jB66SWgijY4bU8J4msxj768U9Qe.jpg",
                "genre_ids": [
                    10764
                ],
                "id": 3626,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "American Idol",
                "overview": "Each year, hopeful singers from all over the country audition to be part of one of the biggest shows in American television history. Who will become the new American Idol?",
                "popularity": 257.021,
                "poster_path": "/wF9LQcz2EzxO2Q34CvKE8sOxGTu.jpg",
                "first_air_date": "2002-06-11",
                "name": "American Idol",
                "vote_average": 5.2,
                "vote_count": 143,
                "character": "Self",
                "credit_id": "525753c0760ee36aaa1f43a9",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    35
                ],
                "id": 4461,
                "origin_country": [
                    "AU"
                ],
                "original_language": "en",
                "original_name": "Rove",
                "overview": "Rove, formerly Rove Live, was an Australian television variety show which premiered on the Nine Network on 22 September 1999, before moving to Network Ten which aired the program from 2000 until November, 2009. The show was hosted by comedian Rove McManus, and featured an ensemble cast, who presented various segments throughout the course of the show. The show won the Logie Award for Most Popular Light Entertainment Program five times.",
                "popularity": 89.505,
                "poster_path": "/znUsPPMZndVOOxlGm6zLk6BpkFo.jpg",
                "first_air_date": "1999-09-22",
                "name": "Rove",
                "vote_average": 8.0,
                "vote_count": 1,
                "character": "Self",
                "credit_id": "52576a24760ee36aaa3cec78",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    99
                ],
                "id": 11091,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Diary",
                "overview": "Diary is an American documentary television series that premiered February 16, 2000, on MTV.\n\nThe show's opening titles begin with the slogan You think you know ... but you have no idea.",
                "popularity": 38.321,
                "poster_path": null,
                "first_air_date": "2000-02-16",
                "name": "Diary",
                "vote_average": 0.0,
                "vote_count": 0,
                "character": "Self",
                "credit_id": "52580b8319c29531db40a248",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/fga95w01nU0UVUSHpeeNz92zv8M.jpg",
                "genre_ids": [],
                "id": 27023,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Oscars",
                "overview": "An annual American awards ceremony honoring cinematic achievements in the film industry. The various category winners are awarded a copy of a statuette, officially the Academy Award of Merit, that is better known by its nickname Oscar.",
                "popularity": 260.79,
                "poster_path": "/wyMHJMQp8WpmBg9CxefvbQnFhrm.jpg",
                "first_air_date": "1953-03-19",
                "name": "The Oscars",
                "vote_average": 6.903,
                "vote_count": 62,
                "character": "Self",
                "credit_id": "52588331760ee34661400e89",
                "episode_count": 6
            },
            {
                "adult": false,
                "backdrop_path": "/lV9jwkGJC5iIYnMwq645UZ56W2.jpg",
                "genre_ids": [],
                "id": 30769,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "Live from Studio Five",
                "overview": "Live from Studio Five was an early-evening British magazine programme which was produced by Sky News for Channel 5. It was presented by Kate Walsh and a line-up of other co-presenters during its run. It consisted of interviews and discussing topical issues, with an emphasis on showbusiness news and celebrity gossip, after originally covering stories from a popular news agenda. It aired its final edition on 4 February 2011 and was replaced by OK! TV in February 2011 which lasted just nine months on air before itself being axed.",
                "popularity": 15.026,
                "poster_path": "/qvcklKVYE12ZUOniclBp1t2QsKP.jpg",
                "first_air_date": "2009-09-14",
                "name": "Live from Studio Five",
                "vote_average": 3.6,
                "vote_count": 10,
                "character": "Self",
                "credit_id": "525899d0760ee346615d9e01",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/1axH9IYz5fCHVUDNXLzivKEQObK.jpg",
                "genre_ids": [
                    10763,
                    35
                ],
                "id": 2224,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Daily Show",
                "overview": "Trevor Noah and The World's Fakest News Team tackle the biggest stories in news, politics and pop culture.",
                "popularity": 926.612,
                "poster_path": "/nhZhgLYBNYDFRkDwljtrrAVtjop.jpg",
                "first_air_date": "1996-07-22",
                "name": "The Daily Show",
                "vote_average": 6.3,
                "vote_count": 456,
                "character": "Self",
                "credit_id": "5419583b0e0a265b800010ca",
                "episode_count": 2
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    18,
                    10764,
                    35,
                    10767
                ],
                "id": 10918,
                "origin_country": [
                    "DE"
                ],
                "original_language": "de",
                "original_name": "Wetten, dass..?",
                "overview": "A long-running German-language entertainment television show based on the format of the British show You Bet! and the American show Wanna Bet?.",
                "popularity": 526.947,
                "poster_path": "/4i8719B3j4z5U5EI1mjw3sOjBWe.jpg",
                "first_air_date": "1981-02-14",
                "name": "Wetten, dass..?",
                "vote_average": 5.643,
                "vote_count": 14,
                "character": "Self",
                "credit_id": "55e9fdd0c3a3682c5f00751c",
                "episode_count": 2
            },
            {
                "adult": false,
                "backdrop_path": "/2pJYis3LUEgFC3UErTQVgmUV1hN.jpg",
                "genre_ids": [
                    35,
                    10767
                ],
                "id": 1220,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "The Graham Norton Show",
                "overview": "Each week celebrity guests join Irish comedian Graham Norton to discuss what's being going on around the world that week. The guests poke fun and share their opinions on the main news stories. Graham is often joined by a band or artist to play the show out.",
                "popularity": 834.657,
                "poster_path": "/vrbqaBXB8AALynQzpWz6JdCPEJS.jpg",
                "first_air_date": "2007-02-22",
                "name": "The Graham Norton Show",
                "vote_average": 7.1,
                "vote_count": 221,
                "character": "Self - Guest",
                "credit_id": "59608ad49251412251096a8a",
                "episode_count": 8
            },
            {
                "adult": false,
                "backdrop_path": null,
                "genre_ids": [
                    10764
                ],
                "id": 89293,
                "origin_country": [
                    "DE"
                ],
                "original_language": "de",
                "original_name": "Bambi-Verleihung",
                "overview": "The Bambi, often called the Bambi Award and stylised as BAMBI, is a German award presented annually by Hubert Burda Media to recognize excellence in international media and television to personalities in the media, arts, culture, sports, and other fields with vision and creativity who affected and inspired the German public that year, both domestic and foreign. First held in 1948, it is the oldest media award in Germany. The trophy is named after Felix Salten's book Bambi, A Life in the Woods and its statuettes are in the shape of the novel's titular fawn character. They were originally made of porcelain until 1958, when the organizers switched to using gold, with the casting done by the art casting workshop of Ernst Strassacker in Süßen.",
                "popularity": 577.097,
                "poster_path": "/7Bc1fE5mKIYmhhgl0fVcw3nvDra.jpg",
                "first_air_date": "1948-01-01",
                "name": "Bambi Awards",
                "vote_average": 9.0,
                "vote_count": 1,
                "character": "Self",
                "credit_id": "5cd84d82c3a3682ae5c0f2db",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/4GVXeBUUkJ0UPhRVWZs1ng62Gj.jpg",
                "genre_ids": [
                    35,
                    10764
                ],
                "id": 33238,
                "origin_country": [
                    "KR"
                ],
                "original_language": "ko",
                "original_name": "런닝맨",
                "overview": "These days, variety entertainment is gradually disappearing. It is one of Korea's representative variety entertainment shows that has been in charge of Sunday evenings for over 10 years. In this program, many stars and members play games and missions together. It is characterized by going around several places. In particular, this program focuses solely on laughter among the many fun elements of entertainment.\n\nOpen your eyes! Big fun enters!\n\nOpen your mouth!  A big smile enters!\n\nOpen your mind! Instructive lesson enters!",
                "popularity": 546.861,
                "poster_path": "/2Wmmu1MkqxJ48J7aySET9EKEjXz.jpg",
                "first_air_date": "2010-07-11",
                "name": "Running Man",
                "vote_average": 8.3,
                "vote_count": 166,
                "character": "",
                "credit_id": "5d270f8ecaab6d001496e683",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/Ajku4m7jbMpCTEPr794Imv19mCA.jpg",
                "genre_ids": [
                    10763,
                    35
                ],
                "id": 4385,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Colbert Report",
                "overview": "The Colbert Report is an American satirical late night television program that airs Monday through Thursday on Comedy Central. It stars political humorist Stephen Colbert, a former correspondent for The Daily Show with Jon Stewart. The Colbert Report is a spin-off from and counterpart to The Daily Show that comments on politics and the media in a similar way. It satirizes conservative personality-driven political pundit programs, particularly Fox News' The O'Reilly Factor. The show focuses on a fictional anchorman character named Stephen Colbert, played by his real-life namesake. The character, described by Colbert as a well-intentioned, poorly informed, high-status idiot, is a caricature of televised political pundits.\n\nThe Colbert Report has been nominated for seven Primetime Emmy Awards each in 2006, 2007, 2008, 2009, 2010, 2011, and 2012, two Television Critics Association Awards Awards, and two Satellite Awards. In 2013, it won two Emmys. It has been presented as non-satirical journalism in several instances, including by the Tom DeLay Legal Defense Trust and by Robert Wexler following his interview on the program. The Report received considerable media coverage following its debut on October 17, 2005, for Colbert's coining of the term truthiness, which dictionary publisher Merriam-Webster named its 2006 Word of the Year.",
                "popularity": 386.815,
                "poster_path": "/pn2CVXjOlR8kY5MgOTJjZ71IM0Q.jpg",
                "first_air_date": "2005-10-17",
                "name": "The Colbert Report",
                "vote_average": 6.876,
                "vote_count": 241,
                "character": "Self (archive footage)",
                "credit_id": "605a91d622df2e006aaac022",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/zEbYJ0BZqnvAZjs8bcBzMkIYVqy.jpg",
                "genre_ids": [
                    10767,
                    35
                ],
                "id": 8563,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Jay Leno Show",
                "overview": "The Jay Leno Show is an American comedy show created by and starring Jay Leno, that aired at 10 p.m. from September 14, 2009 to February 9, 2010 on NBC, after Leno's initial retirement from hosting The Tonight Show with Jay Leno. In January 2010, NBC announced that due to affiliate concerns about its effect on their newscasts, The Jay Leno Show would be shortened to 30 minutes and moved from primetime to 11:35 p.m., the timeslot that had been occupied by The Tonight Show for nearly 60 years.\n\nThe Tonight Show host Conan O'Brien released a public statement saying that he would not participate in moving Tonight to 12:05 a.m., asserting that it would damage the highly respected franchise. Despite much support for O'Brien from both the public and media professionals alike NBC maintained its plan to move Leno to 11:35. On January 21, 2010, NBC reached a $45 million settlement with O'Brien in order to end his contract. Leno resumed his duties as host of Tonight on March 1, 2010. Leno ended on February 9, 2010 after being on the air for only four months, with Entertainment Weekly calling the program television's Biggest Bomb of All Time.",
                "popularity": 168.194,
                "poster_path": "/3ZjkPl1T3deY8cXagvfHGOje9Wb.jpg",
                "first_air_date": "2009-09-14",
                "name": "The Jay Leno Show",
                "vote_average": 4.0,
                "vote_count": 11,
                "character": "Self",
                "credit_id": "605e51837c6de30028d78337",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/Ajku4m7jbMpCTEPr794Imv19mCA.jpg",
                "genre_ids": [
                    10763,
                    35
                ],
                "id": 4385,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Colbert Report",
                "overview": "The Colbert Report is an American satirical late night television program that airs Monday through Thursday on Comedy Central. It stars political humorist Stephen Colbert, a former correspondent for The Daily Show with Jon Stewart. The Colbert Report is a spin-off from and counterpart to The Daily Show that comments on politics and the media in a similar way. It satirizes conservative personality-driven political pundit programs, particularly Fox News' The O'Reilly Factor. The show focuses on a fictional anchorman character named Stephen Colbert, played by his real-life namesake. The character, described by Colbert as a well-intentioned, poorly informed, high-status idiot, is a caricature of televised political pundits.\n\nThe Colbert Report has been nominated for seven Primetime Emmy Awards each in 2006, 2007, 2008, 2009, 2010, 2011, and 2012, two Television Critics Association Awards Awards, and two Satellite Awards. In 2013, it won two Emmys. It has been presented as non-satirical journalism in several instances, including by the Tom DeLay Legal Defense Trust and by Robert Wexler following his interview on the program. The Report received considerable media coverage following its debut on October 17, 2005, for Colbert's coining of the term truthiness, which dictionary publisher Merriam-Webster named its 2006 Word of the Year.",
                "popularity": 386.815,
                "poster_path": "/pn2CVXjOlR8kY5MgOTJjZ71IM0Q.jpg",
                "first_air_date": "2005-10-17",
                "name": "The Colbert Report",
                "vote_average": 6.876,
                "vote_count": 241,
                "character": "Maverick (archive footage)",
                "credit_id": "606142fb53866e006a8eecda",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/xl1wGwaPZInJo1JAnpKqnFozWBE.jpg",
                "genre_ids": [
                    35,
                    10767
                ],
                "id": 59941,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "The Tonight Show Starring Jimmy Fallon",
                "overview": "After Jay Leno's second retirement from the program, Jimmy Fallon stepped in as his permanent replacement. After 42 years in Los Angeles the program was brought back to New York.",
                "popularity": 1347.246,
                "poster_path": "/g4amxJvtpnY79J77xeamnAEUO8r.jpg",
                "first_air_date": "2014-02-17",
                "name": "The Tonight Show Starring Jimmy Fallon",
                "vote_average": 6.004,
                "vote_count": 237,
                "character": "",
                "credit_id": "62c84faf498bc200dd088c36",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/3Jp0J9MnIrmC20ZkcS2bXIYkKYv.jpg",
                "genre_ids": [
                    10767,
                    35
                ],
                "id": 40302,
                "origin_country": [
                    "GB"
                ],
                "original_language": "en",
                "original_name": "The Jonathan Ross Show",
                "overview": "The Jonathan Ross Show is a British chat show presented by Jonathan Ross. It was first broadcast on ITV on 3 September 2011 and currently airs on Saturday evenings following the conclusion of Ross' BBC One chat show, Friday Night with Jonathan Ross, in July 2010.",
                "popularity": 259.981,
                "poster_path": "/kVdXrrqVlNdqdzmQcnc3yeYqUkH.jpg",
                "first_air_date": "2011-09-03",
                "name": "The Jonathan Ross Show",
                "vote_average": 5.1,
                "vote_count": 16,
                "character": "Self",
                "credit_id": "641f979108cf8700bfed3e30",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/dTsSD3ww6PNfkiX4Fo7wdSJKaSc.jpg",
                "genre_ids": [
                    99
                ],
                "id": 223768,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Pretty Baby: Brooke Shields",
                "overview": "Actor, model, and global superstar Brooke Shields’ journey from a sexualized young girl to a woman who embraces her identity and voice.",
                "popularity": 130.929,
                "poster_path": "/sgEzuz9UPdJz9Eu5fl6LMA1J2Gm.jpg",
                "first_air_date": "2023-04-03",
                "name": "Pretty Baby: Brooke Shields",
                "vote_average": 7.9,
                "vote_count": 14,
                "character": "Self (archive footage)",
                "credit_id": "6458c28a77d23b015393c137",
                "episode_count": 1
            },
            {
                "adult": false,
                "backdrop_path": "/xCdCsHCH7VCQqaDUPD5tG6omMsB.jpg",
                "genre_ids": [
                    10767,
                    35
                ],
                "id": 1489,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Jimmy Kimmel Live!",
                "overview": "Jimmy Kimmel Live! is an American late-night talk show, created and hosted by Jimmy Kimmel and broadcast on ABC.",
                "popularity": 297.252,
                "poster_path": "/hWLCBGQ2RFpjXyaKRMbL5bGEEDT.jpg",
                "first_air_date": "2003-01-26",
                "name": "Jimmy Kimmel Live!",
                "vote_average": 5.6,
                "vote_count": 129,
                "character": "Self",
                "credit_id": "64bb67379d592c012465940e",
                "episode_count": 1
            }
        ],
        "crew": [
            {
                "adult": false,
                "backdrop_path": "/pdczRO8IUoyp2q4da3lz4JD0a0p.jpg",
                "genre_ids": [
                    80,
                    18,
                    9648
                ],
                "id": 4981,
                "origin_country": [
                    "US"
                ],
                "original_language": "en",
                "original_name": "Fallen Angels",
                "overview": "Fallen Angels is an American neo-noir anthology television series that ran from 1993 to 1995 on the Showtime pay cable station and was produced by Propaganda Films. No first-run episodes were shown in 1994.\n\nThe series was executive produced by Sydney Pollack and produced by Steve Golin and others. The theme song was written by Elmer Bernstein and the original music was written by Peter Bernstein.\n\nPeriod torch songs by performers like Patti Page and Billie Holiday were used periodically.\n\nIn Europe, the show is known as Perfect Crimes and shown in France on Canal +, and in England.",
                "popularity": 62.804,
                "poster_path": "/fnbdv4uSFUGJ2jp9Gf99fYtlIu3.jpg",
                "first_air_date": "1993-08-01",
                "name": "Fallen Angels",
                "vote_average": 5.0,
                "vote_count": 6,
                "credit_id": "52577c9b760ee36aaa5969c6",
                "department": "Directing",
                "episode_count": 1,
                "job": "Director"
            }
        ]
    }
}
""".data(using: .utf8)

func getCastDetailResponce() -> Person?{
    let responce: Person?
    do {
        guard let data =  castData else {
            print("nil returned data \n\n")
            return nil
        }
        responce =  try JSONDecoder().decode(Person.self, from: data)
    } catch(let error){
        print("error in decode : \(error) \n\n")
        return nil
    }
    return responce
}
