//
//  AnimalQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/15/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class AnimalQuiz {
    
    var arrayImage = [          "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F001-mouse.png?alt=media&token=2b4ece8e-8bc5-4c22-9a4a-89b6a79d93b5",
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F002-cow.png?alt=media&token=e745c0aa-5c8c-4d7a-85f8-e432238289a6",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F003-kangaroo.png?alt=media&token=cdc93301-0018-44e4-ae6f-0551b4667fb2",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F004-bear.png?alt=media&token=472fcc10-6e17-4790-97dd-f77b1e73ef83",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F005-flamingo.png?alt=media&token=9b15af17-38ba-49b0-886b-07b52ba29d65",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F006-fox.png?alt=media&token=e21ce7aa-66c5-4e0b-b6ed-d23ad76d2223",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F007-bat.png?alt=media&token=0695cfbf-feaf-42c0-a411-da08be5f4973",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F008-crab.png?alt=media&token=e03cfc53-5a35-478f-bb12-980b3c452ff4",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F009-lion.png?alt=media&token=5b69f4da-220a-4f49-b7f1-f760c274c5f7",
                      
                      "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F010-frog.png?alt=media&token=642be74a-4306-48bb-a9f8-fd000c527b6d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F011-bee.png?alt=media&token=f9ece484-e418-485b-9475-566ca7314dc1",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F012-koala.png?alt=media&token=75969abb-7673-4254-b78f-88da39c98c2e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F013-tiger.png?alt=media&token=6bd45e91-4cd0-4f27-aaf2-e3c8d139dc37",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F014-rhino.png?alt=media&token=b696d0de-c436-446b-9298-9f3b2b469993",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F015-squirrel.png?alt=media&token=add41c69-3697-4f04-a7b4-a2767d9f9fa6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F016-whale.png?alt=media&token=20e493f5-ce73-4771-9aa7-ba3cbd48300b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F017-duck.png?alt=media&token=7edd36fb-65f9-4a1b-a3a6-a82881d807ce",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F018-camel.png?alt=media&token=80cb85ed-6f4d-4d03-886d-7d54b93f93ab",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F019-shark.png?alt=media&token=04f02a8f-b60e-4277-a872-8b18990aa368",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F020-bird.png?alt=media&token=99e96573-791c-43f8-9a0d-7603cd6cf582",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F021-rabbit.png?alt=media&token=4dde7d90-6122-470f-82a0-b41381eb6a21",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F022-llama.png?alt=media&token=c7e92c5e-340c-4815-9dc8-762d7be9fdd7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F023-cat.png?alt=media&token=3ec20255-6e16-41ad-9f47-c3b3aeb9e457",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F024-hedgehog.png?alt=media&token=cab40f97-9022-4b67-bdd2-573b2e698e9d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F025-octopus.png?alt=media&token=29b90f64-5ed9-4604-8699-37b59c2b248e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F026-snail.png?alt=media&token=aeb71bce-522a-455e-b35e-34ecd0282b8a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F027-giraffe.png?alt=media&token=fa2273f9-d66b-4206-8eb1-c0a8e00dc640",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F028-manta%20ray.png?alt=media&token=2aeb866f-9188-41bf-81f8-f6eff0b47b86",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F029-wolf.png?alt=media&token=2eb9b7fe-1bf9-4d65-b40e-04c8d0e377ca",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F030-penguin.png?alt=media&token=b5fcabff-4025-4f09-9890-998bfe1a2a58",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F031-panther.png?alt=media&token=6371d856-9457-4696-b0ad-d7373fe52400",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F032-elephant.png?alt=media&token=dac0acc8-59c9-4079-ad8c-71a2b1bf1240",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F033-reindeer.png?alt=media&token=04aa441d-8fb6-4402-93fd-dbc0367011d2",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F034-chameleon.png?alt=media&token=bc13ab5c-3c00-4282-a415-c5ad6af56b66",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F035-crocodile.png?alt=media&token=ee20fb1c-2763-4224-8be0-c428616ec2e9",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F036-butterfly.png?alt=media&token=b19e6836-459a-4f3c-8004-5419218b9fc3",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F037-owl.png?alt=media&token=b0a1ff37-9f0f-4b12-bd8d-271d07da3c60",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F038-turtle.png?alt=media&token=cc9c4db1-3d9b-4d1b-917e-37985dfbdc5b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F039-snake.png?alt=media&token=cae79cdb-d868-45ed-a9d5-a6860a1723ea",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F040-polar%20bear.png?alt=media&token=7134007f-5f9e-44c6-b9fd-70d5aa3f2b4a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F041-monkey.png?alt=media&token=fd43e28f-0a43-4a97-b2bf-6a180a09d2a5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F042-chicken.png?alt=media&token=57001ca6-0048-4c41-aa76-b5b74aab9865",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F043-sloth.png?alt=media&token=071446b0-28dc-4f62-b35c-6784392088fa",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F044-dog.png?alt=media&token=c05e0540-a5c9-4f07-b2f4-4cb9ab5739a6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F045-dolphin.png?alt=media&token=bef5a9b8-2f26-4a34-9c59-e48530ec2319",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F046-pig.png?alt=media&token=3cf70251-3e76-4b33-9170-dd1e3679fb60",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F047-hippopotamus.png?alt=media&token=ea0ff861-5b4b-4ee0-b201-f12f56229a5c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F048-parrot.png?alt=media&token=a7a78e75-4ec0-41a5-8519-57b727843c1e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F049-clownfish.png?alt=media&token=a3e60bfb-e846-4303-bd4b-2fb5fedead2b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/AnimalQuiz%2F050-horse.png?alt=media&token=ed347134-b03d-45e2-bc3b-cc3e99af0a93"
        
    ]
}
