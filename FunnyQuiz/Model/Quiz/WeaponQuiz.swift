//
//  WeaponQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/15/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class WeaponQuiz {
    var arrayImage = [
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Faim.png?alt=media&token=1bb2e30f-c590-43d9-aa27-26a2fc887af6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbackpack.png?alt=media&token=45014435-d6f5-4597-aa0c-2392a92ccc15",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbadge.png?alt=media&token=c9575b8c-0879-42e7-867e-f71addab22f0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbinoculars.png?alt=media&token=cda61b14-a333-443c-a088-a2a504d168f7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbiohazard.png?alt=media&token=f5f0786e-bbb0-41d9-942a-612af372837d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbomb.png?alt=media&token=7cdb141e-78ee-48c2-ad58-c85899201a81",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbullet.png?alt=media&token=8d6c9648-c019-4649-a47d-0dc2309d7f09",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbulletproof-vest.png?alt=media&token=819a06fd-c0a4-403e-964e-f6ef21f31f45",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fbullets.png?alt=media&token=19c941af-a1aa-48fc-b768-3f70485c4c96",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fcannon.png?alt=media&token=0fbe2e8d-9bcb-4e59-812a-2bf67611b7f6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fchevron.png?alt=media&token=9ceb060e-f661-4613-8067-5c556c2a4989",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fcruiser.png?alt=media&token=ff79ba1c-96bd-45b4-8670-97d70726449f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Ffighter.png?alt=media&token=39c8a26f-b4d2-47ae-9abc-0ecad688e8ca",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Ffirst-aid-kit.png?alt=media&token=4ef7e24e-d3fa-4383-b285-c1943812ac7a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fgas-mask.png?alt=media&token=be1b3cc3-3e75-4ebf-8385-2fdea3fe43a6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fgrenade.png?alt=media&token=206ac1df-7f32-4a1c-b5c6-0c2b32beed54",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fgun.png?alt=media&token=1978b012-43ba-455a-9f5c-27160403542d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fhandcuffs.png?alt=media&token=eee745e1-2dbc-4591-a85b-49a06e87e719",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fhelicopter.png?alt=media&token=75ca0774-aa04-43f4-a9cf-29345074f128",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fhelmet.png?alt=media&token=bd8ba5b4-59fb-42d3-abd8-ece499b22bef",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fknife.png?alt=media&token=38032bc7-7247-4158-bcf5-2e24f66534fb",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Flauncher.png?alt=media&token=cbf4092c-3be9-4ab4-8e73-8af17b1eb951",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fmachine-gun.png?alt=media&token=70a4189b-fef1-46d8-8177-77d018e515ce",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fmedal.png?alt=media&token=7dfd755f-1a7e-42d6-aeb2-6ebf333a1bad",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fmolotov-cocktail.png?alt=media&token=22b22f90-0bc5-4a8a-8d5b-1f9ec45c4b4a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fparachute.png?alt=media&token=3a11f37c-9705-4fd6-82f5-a6c1217a1cec",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fradar.png?alt=media&token=9cb6ea6a-6628-496e-ae37-6dd7cabb3288",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fradiation.png?alt=media&token=52c34135-5f5c-435b-9179-a4b6e86828d8",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Frevolver.png?alt=media&token=2b9e724a-0b52-4333-83a6-fbe2327ea68d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Frifle.png?alt=media&token=a8f36c52-9077-4e76-af94-62bedb64a841",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Frocket.png?alt=media&token=d8b83097-9f34-4e9b-b8ba-4c6cc0f8b56f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fshotgun.png?alt=media&token=0d4e7337-3e80-4187-9632-4571bbc4f463",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fsniper.png?alt=media&token=b37956bc-6bc0-4217-b907-41b0fabfb749",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fsubmarine.png?alt=media&token=90677979-b01a-4171-91f2-ccb471d5b719",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Ftank.png?alt=media&token=5f559e6d-90c3-472c-b3ee-e0768417bc00",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Ftoken.png?alt=media&token=8b78ae08-0f3e-4060-921c-cf3e62c6cf46",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Ftorpedo.png?alt=media&token=c3b7f2fe-9912-459f-837c-bfa1e58ce337",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/WeaponQuiz%2Fwalkie-talkie.png?alt=media&token=61862486-1f57-497b-8bf3-c47223c1c25e"
        
        
    ]
}
