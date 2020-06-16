//
//  CampingQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/15/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class CampingQuiz {
    
    var arrayImage = [
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Faxe.png?alt=media&token=1246bcf8-7a5c-45df-a57a-0f29ff34499b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbackpack.png?alt=media&token=ae7eb569-a2d7-4727-9a35-d1b99df682e3",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbarbecue.png?alt=media&token=6dc9e3fa-ab72-4eb8-b1b5-11d7c8a0ae30",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbasket.png?alt=media&token=2c119fc2-8a3a-432a-8606-9c3cd54efbed",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbinoculars.png?alt=media&token=6c147a3c-0b4d-4c0a-8004-b67fd86f2695",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbonfire.png?alt=media&token=57242b6f-d662-4199-afb1-74fb7e65e4d3",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fboot.png?alt=media&token=599b840f-a707-42ba-90fc-c0ca292e3bb1",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fbucket.png?alt=media&token=db74092f-e186-4bd8-8ffe-17cd6e7a5863",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fburner.png?alt=media&token=92c1d213-aef4-4730-9b30-fefeb69d2314",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcamp-chair.png?alt=media&token=e8521b19-a485-46c9-8f88-bdb860735972",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcamp-table.png?alt=media&token=d84f2085-e22e-44cf-ad12-9868b227413f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcanned-food.png?alt=media&token=5ce0c886-e6c4-415d-8682-9067cf3f9b90",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcauldron.png?alt=media&token=6029c9c8-1e4a-46f0-8064-bec39a0c5699",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcompass.png?alt=media&token=98fa78a2-23bf-4888-9a23-3bff56356df0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcup.png?alt=media&token=47661dfc-3188-4b27-80b1-d3b7942f4e20",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fcutlery.png?alt=media&token=de48d675-7bf6-4d2d-92f8-27ce9acbac64",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Ffirst-aid-kit.png?alt=media&token=e31ac3c3-c27e-49e2-8cb1-ff76c8bc9938",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fflashlight.png?alt=media&token=395ce00d-ac90-4df6-84bd-8b3a4a9a0753",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fflask.png?alt=media&token=d45bfde8-caba-4048-aac0-6710970c58f0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fforest.png?alt=media&token=997542c9-3dc5-4764-ae2f-2775670c4571",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fguitar.png?alt=media&token=00befb16-a2e7-4ee1-b758-6960a6813b4a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fhead-light.png?alt=media&token=24d502b3-eb97-491f-8032-4f550abd9958",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Finflatable-boat.png?alt=media&token=797c87df-08d3-4e54-a079-d50ac1a7fa6b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Finsect-repellent.png?alt=media&token=95b73b79-65db-4bf6-8ed7-799c0c8bcf80",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fkettle.png?alt=media&token=a73b2464-aa79-4e33-a761-976120730bc4",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fknife.png?alt=media&token=72f23b67-6d0a-46b6-bc2a-9bba345e0f11",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Flog.png?alt=media&token=668a83ce-67f8-4b59-b90a-5e6f84a9751f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fmarshmallow.png?alt=media&token=12f190b4-5362-426c-9387-5e60f4752197",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fmatches.png?alt=media&token=dc6db870-40b5-4b8b-99d7-ee7f793e316f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fmountains.png?alt=media&token=75edab64-d2fb-4e84-969e-2b7fb636d1bc",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Foil-lamp.png?alt=media&token=9717485f-d1c3-4912-ba17-b3963836ec62",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Forientation.png?alt=media&token=3305b88b-9d91-4193-94c0-f89caae58a89",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fpan.png?alt=media&token=7896dabb-08f3-4c99-8cd3-d010b5cd8e9b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fpenknife.png?alt=media&token=ae6ab871-9ba9-482a-b8ac-411362732d06",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fphoto-camera.png?alt=media&token=5041d8f1-8d44-41b1-b599-789ffd76ce81",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fpick.png?alt=media&token=4620b112-55af-4257-92b3-c4adf2275815",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fpot-on-fire.png?alt=media&token=97a6c7a2-0058-4b51-abfb-0a33ebb22a00",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fradio.png?alt=media&token=1f63281b-2b72-4df7-ba08-c1d4dbe03e79",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Frope.png?alt=media&token=d2912bf5-8daf-4c0b-a66c-b83fffc67de7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fsandwich.png?alt=media&token=361e44cd-5932-4435-9030-0f80f829ca4a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fshotgun.png?alt=media&token=6c766a5b-aebf-43d6-847d-7b883f56598a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fshovel.png?alt=media&token=c3a5446b-25c1-48c7-847f-b987295243e7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fsleeping-bag.png?alt=media&token=34c6468a-a3d8-445b-a1d3-e0fee426ebd1",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fspinning.png?alt=media&token=0d08ffd7-7783-413b-b42a-38d4865407f5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Ftent.png?alt=media&token=5100cfac-7c26-402d-b750-309792680658",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Fthermo.png?alt=media&token=9f628329-6c0d-4e57-8200-f4cfb7b48f28",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Ftrailer.png?alt=media&token=d42c7409-1b1c-4283-a5fa-0a9a07a12858",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/CampingQuiz%2Ftree.png?alt=media&token=e62d6951-78bf-48b5-ac53-0fa85ad72268"        
    
    ]
}
