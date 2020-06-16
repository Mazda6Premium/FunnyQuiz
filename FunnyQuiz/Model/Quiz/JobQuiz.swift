//
//  JobQuiz.swift
//  FunnyQuiz
//
//  Created by Trung iOS on 6/15/20.
//  Copyright © 2020 Fighting. All rights reserved.
//

import Foundation

class JobQuiz {
    var arrayImage = [
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F001-dj.png?alt=media&token=17a22eca-fb4e-4695-aed0-ce0a310300e2",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F002-hairdresser.png?alt=media&token=7b8bbf22-cec6-446c-945d-239a1133d684",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F003-astronaut.png?alt=media&token=f8d5ab79-5e1b-440b-a792-259c996107a8",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F004-firefighter.png?alt=media&token=2d93de21-4d19-40c5-ace0-9965c5ea3658",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F005-plumber.png?alt=media&token=c525908f-e6cf-4a62-8985-88a5ec024a35",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F006-gardener.png?alt=media&token=5af1fa3b-c969-4eb5-ad32-cbc890197a70",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F007-policeman.png?alt=media&token=152f08ae-6dab-488f-b39d-3b072f767dda",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F008-manager.png?alt=media&token=a8b6c0db-3930-46c4-98f8-dc0b7a3dfce6",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F009-builder.png?alt=media&token=6e4b6019-cd8d-443c-aed7-3281da000992",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F010-taxi-driver.png?alt=media&token=0c932b0b-af15-43ac-afd5-ace3df254cff",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F011-nurse.png?alt=media&token=699f12f1-74e8-4901-abc3-55060a9247ad",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F012-teacher.png?alt=media&token=3a895493-4603-4a6a-8bab-5ee4fb6b8b8d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F013-soldier.png?alt=media&token=70fff3a8-9a78-44fd-941b-cf6dd64a33a0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F014-detective.png?alt=media&token=6a92ccff-b8ca-45ac-a704-c0e9a0bdeab5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F015-writer.png?alt=media&token=6d7abb30-226f-4669-acee-b967eaef66d5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F016-maid.png?alt=media&token=82aa7627-89cd-46b7-89d9-dae9c0790002",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F017-cashier.png?alt=media&token=348510f9-1766-4f2b-a422-79d51265bafd",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F018-postman.png?alt=media&token=c69b9f7c-e5df-4b43-b740-d1e78e71ecb5",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F019-stewardess.png?alt=media&token=e7af5dc5-0bd7-42a6-b76d-9d6ed82ccddc",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F020-dyer.png?alt=media&token=d11344e8-a6a8-4636-8103-b14d98a44700",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F021-courier.png?alt=media&token=82ea3d4d-66ba-4381-a415-d682d8d69436",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F022-waiter.png?alt=media&token=b4bd31d0-e844-4f7b-8587-0eb175df2ab1",
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F023-doctor.png?alt=media&token=6195861b-6ce5-4f54-a241-887720d93969",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F024-electrician.png?alt=media&token=d843dbf0-f38c-4037-ac84-f12f757417ab",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F025-athlete.png?alt=media&token=03c50045-5100-4c51-8c59-12442a69157f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F026-miner.png?alt=media&token=fc14d4a4-efe0-4da1-8ef9-c9353c02606d",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F027-mechanic.png?alt=media&token=48a0c670-0437-4bb0-b501-aa5f0d373abc",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F028-showman.png?alt=media&token=47465cee-ad51-4036-a04c-cad144dfff1f",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F029-concierge.png?alt=media&token=baa04c0b-d8b5-4e42-a0f1-3dfcb496e922",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F030-magician.png?alt=media&token=95a318d4-0e9c-4bb2-bc37-1ddbea6c3e27",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F031-diver.png?alt=media&token=72e383b8-1d71-4468-be72-79c2833ad159",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F032-priest.png?alt=media&token=f4dd364a-f59a-4959-a050-f0b68c5981e7",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F033-secretary.png?alt=media&token=ee519acc-c8aa-4eb0-bc42-3b3e368a369e",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F034-professor.png?alt=media&token=343a45c1-40e1-448c-8804-0898e7baec80",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F035-support.png?alt=media&token=2bdac5d2-61c3-4147-a9a7-fa2c49d98f82",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F036-politician.png?alt=media&token=ef360142-072b-4624-a791-ddfcb50f76ab",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F037-painter.png?alt=media&token=5d1460da-202f-436a-98c3-956f8fe9ef9a",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F038-sailor.png?alt=media&token=716e10a3-4711-4a9f-938a-07a9c11a4b5b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F039-singer.png?alt=media&token=528bfba3-464e-48c3-a040-ca83580e118b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F040-farmer.png?alt=media&token=4d547394-e516-43b6-9351-9d4716d3ec53",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F041-clown.png?alt=media&token=7fa39e2a-180f-41e6-bfbc-3f9b2f6ff850",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F042-lumberjack.png?alt=media&token=9f5a9f5a-fb05-450b-94fb-5c65a828b706",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F043-fisherman.png?alt=media&token=34895b3b-bb0c-4f65-9268-b95882056b83",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F044-carpenter.png?alt=media&token=28160925-6a16-473e-96b8-aaf71fd44b16",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F045-chef.png?alt=media&token=d6e6410c-a0f2-4eeb-a003-36d6a7375601",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F046-pensioner.png?alt=media&token=11abf611-ca4b-4852-844a-05d5d5df5ac0",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F047-programmer.png?alt=media&token=ffa8a944-7ba2-47b1-8ec6-c96bbc21d06b",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F048-pilot.png?alt=media&token=dc6c5213-58f0-49be-8b6c-c220fb72017c",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F049-chemist.png?alt=media&token=e686ed80-800a-4edc-bc95-4298f29b90aa",
        
        "https://firebasestorage.googleapis.com/v0/b/funnyquiz-07062020.appspot.com/o/JobQuiz%2F050-photographer.png?alt=media&token=142597bc-f5a9-4a25-8476-3834ba907fb0",
        
    ]
}
