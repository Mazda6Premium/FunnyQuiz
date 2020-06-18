//
//  VehicleQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/18/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class VehicleQuiz {
    
    var arrayImage = [
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F001-rickshaw.png?alt=media&token=8c249ab3-09bf-4e47-9cc0-64ec0536d063",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F002-golf%20cart.png?alt=media&token=eb26615d-0a3f-49f2-9826-65ce97c4fd53",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F003-electric%20car.png?alt=media&token=a06313ca-7856-489f-aa58-2465e51d05cc",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F004-van.png?alt=media&token=f680be89-bddb-42df-8de1-eb3f6b421c83",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F005-luxury.png?alt=media&token=8b0022a2-e163-41c3-8f0a-f9f7c781a84c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F006-rollers.png?alt=media&token=fcb9efff-a95d-412f-8f60-33e63f8fabf9",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F007-submarine.png?alt=media&token=b97cb4fb-f05f-4b8b-96ee-e2f2f7022294",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F008-pickup.png?alt=media&token=f848ea9d-ed0e-4f48-9150-7eb4b930be9d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F009-garbage%20truck.png?alt=media&token=93a9c494-46d5-4b59-9956-57262a35af4e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F010-ship.png?alt=media&token=a3001136-fbd6-4a69-bb27-18b5378983a6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F011-bus.png?alt=media&token=1996536f-5ec4-412c-b46f-cd5276d5e80d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F012-tractor.png?alt=media&token=26774966-8f5b-4920-a1d1-70208d0cfd3d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F013-water%20supply.png?alt=media&token=113253ba-0d54-4cf0-861f-6eca37968d4a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F014-ambulance.png?alt=media&token=fc1180fc-5ad8-4c98-ab0c-2a12bfd202eb",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F015-race%20car.png?alt=media&token=f742ef1f-dd79-45db-b87f-7ebefcb45885",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F016-garage.png?alt=media&token=516cd713-5e06-468b-99ea-e7d90c6489bd",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F017-taxi.png?alt=media&token=1a79e686-93b0-42d6-8279-9cf686aa6bde",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F018-scooter.png?alt=media&token=db620ffa-4450-4b69-bbea-f0d895034a63",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F019-hoverboard.png?alt=media&token=8d70327a-0952-487d-bc3a-ba716b6f3ca0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F020-food%20truck.png?alt=media&token=12c253bb-bfb4-462b-a43f-61901ccb5a5e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F021-segway.png?alt=media&token=63330d0e-6cfb-4764-bd31-b57452496df6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F022-old%20car.png?alt=media&token=023d7bdd-3656-4185-9dc6-071fd16eca0c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F023-van.png?alt=media&token=3e5f7991-e605-42a2-bb1e-c9218bbe1d12",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F024-bus.png?alt=media&token=5090b115-c75d-4529-8ce9-b0904f29f3d7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F025-train.png?alt=media&token=1a1340aa-6885-4afb-9ec4-96e8b150209e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F026-fire%20truck.png?alt=media&token=132d3f22-61a0-476b-9516-e65fcca204ae",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F027-police%20car.png?alt=media&token=9411c76d-3532-4279-84c2-c98f5fe6503d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F028-kart.png?alt=media&token=e0c9180e-5ecd-4c70-8b6a-6de438f439ed",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F029-helicopter.png?alt=media&token=4b19a1ec-79d5-4cd6-a893-70f3398c4655",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F030-bicycle.png?alt=media&token=1ce0c239-5fec-44e9-af71-cb055e589e96",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F031-car%20wash.png?alt=media&token=44ba1072-8d26-4e15-8faf-34ba3e4af171",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F032-school%20bus.png?alt=media&token=42ac3f4b-1acd-453b-8433-7ceddb21c9ea",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F033-funicular.png?alt=media&token=3f7a0d64-0695-4cef-95f2-c9d1d5b48942",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F034-scooter.png?alt=media&token=78a98ae4-6082-4bef-82c1-95ac1716067a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F035-ice%20cream.png?alt=media&token=95a4946f-25d2-4be7-84a7-db6cdf2b0216",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F036-metro.png?alt=media&token=d4680e91-5b02-4ebe-9462-02a5e606a87e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F037-limousine.png?alt=media&token=22c3964c-5c65-4a11-b02a-bf8bae82bd27",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F038-car.png?alt=media&token=e527f06c-bf86-425c-b3ad-34732fe644e9",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F039-tram.png?alt=media&token=c2851b33-f511-4134-b9aa-57990330ce8e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F040-delivery%20truck.png?alt=media&token=ecc8ab7e-70c4-441b-967e-08d1bd1d9fca",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F041-repair%20car.png?alt=media&token=d871a242-41cc-4d10-b8b2-6483425f2c7f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F042-vintage%20car.png?alt=media&token=75a555c9-4ee3-4843-a17e-379f65ab4fdd",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F043-dump%20truck.png?alt=media&token=bf9257ae-d61d-46ef-9831-7404f5637e8a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F044-motorcycle.png?alt=media&token=cd70925c-3df5-4d5c-bf7e-e69b111d2f81",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F045-concrete%20truck.png?alt=media&token=578866d8-cefc-4a6f-a18d-9529c028f867",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F046-spaceship.png?alt=media&token=67231efb-80d1-4b0f-bd7e-1c144d08345c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F047-quad.png?alt=media&token=9c324fc2-d41f-48ec-95f0-f849fbae2056",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F048-yacht.png?alt=media&token=d32a93f4-a0e5-434b-9ce5-5545edead919",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F049-one%20wheel.png?alt=media&token=b39c8e9a-72c1-4736-9129-1228a467febe",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/VehicleQuiz%2F050-cabriolet.png?alt=media&token=d8c68430-bfe3-4687-870a-0162868605c5",
    ]
}
