//
//  SportQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/17/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class SportQuiz {
    var arrayImage = [
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F001-bowling.png?alt=media&token=33add64c-f376-4822-974f-8f10b05b1373",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F002-ping%20pong.png?alt=media&token=475cf5e4-3d09-4165-aa62-a7e68c216ef5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F003-dumbbell.png?alt=media&token=29aab363-0bfc-4cef-a05b-24cc1188936b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F004-cricket.png?alt=media&token=267829df-6d45-462d-af3a-7f17744422cb",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F005-baseball.png?alt=media&token=4a03d372-6b3c-4924-aa66-87c7e93adf55",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F006-american%20football.png?alt=media&token=b9098538-3220-4187-8aae-fdd361512e71",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F007-boxing%20gloves.png?alt=media&token=ef70f82a-e11b-4312-90c1-539390c07460",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F008-champion%20belt.png?alt=media&token=1fa78854-8990-4c95-8e05-92338114a0b1",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F009-punching%20bag.png?alt=media&token=6d8c9f66-d1c8-4b7b-8a03-c13974e34803",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F010-archery.png?alt=media&token=0d10035e-bb58-49a3-8275-b30d237f4cc2",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F011-ice%20skate.png?alt=media&token=69b3f0bb-feca-46db-b292-a47833f00e42",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F012-hockey.png?alt=media&token=4ab5b974-39d9-4bb6-b9d2-ba8efd8c8742",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F013-Surfboard.png?alt=media&token=9e73e7a3-60e4-43fe-bf8a-6849022a32ce",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F014-golf%20bag.png?alt=media&token=224e2ea4-7c5b-4cb7-994e-3142902a4880",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F015-finish%20flag.png?alt=media&token=7d836fed-0474-4d84-83c4-ff8f6dec07be",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F016-trophy.png?alt=media&token=1ad54749-47b2-4397-88e4-212b3d727792",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F017-badminton.png?alt=media&token=ef7af824-4687-4e48-988b-64d22279a9ee",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F018-medal.png?alt=media&token=e3b80603-bd3c-4d7e-a059-78133dc4c42a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F019-commentator.png?alt=media&token=f61ecd81-b4aa-4c07-89cf-4ad091fc76e3",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F020-net.png?alt=media&token=79a8c32d-0107-46c3-a85e-6e473014de62",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F021-chess.png?alt=media&token=cb2745a7-b85d-46af-b928-976fe200c085",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F022-whistle.png?alt=media&token=f41f824c-d292-4d3f-83e0-e5f76a37fe87",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F023-referee.png?alt=media&token=d3fa974d-fc5c-46ce-a741-e99d7e3dd145",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F024-darts.png?alt=media&token=3bfcbb0a-5fec-4539-9e5c-1985048d3f39",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F025-running%20shoes.png?alt=media&token=df0eb9c3-aa9c-4b9b-95cc-3069ebc1e26d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F026-podium.png?alt=media&token=587a591a-4246-4e2f-a969-876fe5997247",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F027-golf%20stick.png?alt=media&token=c7bbdb5c-7071-453a-a4ae-93e9dd684a1f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F028-bicycle.png?alt=media&token=0db6fd16-2200-47f9-b23f-fdfca6f17570",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F029-nutrition.png?alt=media&token=fdeaaaa2-ed18-4d53-afd3-0ba0b74e4608",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F030-tennis.png?alt=media&token=dcca5c22-631b-48c7-a6e5-4a1357db5c72",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F031-stopwatch.png?alt=media&token=7bcbeec9-43db-4e5d-9782-44c0c7788abd",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F032-soccer%20ball.png?alt=media&token=a7b34e8b-4934-4608-bb3f-23085ea37929",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F033-sport%20bottle.png?alt=media&token=a93e346f-0a43-4842-ae37-7a9e75d616fc",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F034-fencing.png?alt=media&token=ff5bce99-7ffe-4821-b886-b93e73ec41c6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F035-motorcycle.png?alt=media&token=8e646c04-4771-4815-b726-b003ebffed81",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F036-basketball.png?alt=media&token=c21d7813-3b5b-4813-a04b-ce8f01e7abbe",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F037-canoe.png?alt=media&token=cfaa978d-644c-49c6-9e12-aaa2705a13f4",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F038-speed%20boat.png?alt=media&token=c8e98330-a350-4ec1-8ff8-616d16a42663",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F039-lacrosse.png?alt=media&token=1e48639c-f4d7-4952-b729-e52120519252",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F040-score%20board.png?alt=media&token=2af441fa-dfe7-4902-9956-59560c9d3c0f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F041-baseball%20glove.png?alt=media&token=ea159039-b6f1-4549-b806-74bc490ceff9",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F042-curling.png?alt=media&token=3a3d0547-b2f7-4c4a-a0c5-c61e79b5dc16",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F043-sailing.png?alt=media&token=9c771fea-df58-4ac6-bf05-6fc9f74a8c8c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F044-jersey.png?alt=media&token=aea69b34-67b3-429d-b9c8-384db72ced33",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F045-swimming.png?alt=media&token=3e397361-8dd7-4167-aa1a-48629d9ce59b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F046-racing.png?alt=media&token=6a082e47-fb0a-480f-bb62-32f0600b62f8",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F047-weight%20lifting.png?alt=media&token=ddcb5ed4-2a53-44a0-b623-a336f56a54b2",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F048-medical%20check.png?alt=media&token=604a2b93-80ad-497f-9739-491fe9f23226",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F049-skipping%20rope.png?alt=media&token=0f9b7fb4-0d56-4c83-ade2-aa8a69a1e178",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/SportQuiz%2F050-kettlebell.png?alt=media&token=6ead98eb-1b2b-4f76-81f8-d0ae79e956d0",
    ]
}
