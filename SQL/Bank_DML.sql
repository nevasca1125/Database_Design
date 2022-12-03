--Goods_Card--
INSERT INTO Goods_Card VALUES('청년미래카드', '체크카드', 1000000, '적립, 생활, 문화', '2030청년');
INSERT INTO Goods_Card VALUES('시니어카드', '체크카드', 2500000, '백화점, 적립', '5060 노년층');
INSERT INTO Goods_Card VALUES('교통서비스카드', '체크카드', 500000, '교통, 적립, 문화', '대중교통 이용자');
INSERT INTO Goods_Card VALUES('반려동물사랑카드', '신용카드', 5000000, '적립, 반려동물', '반려동물보호자, 250');
INSERT INTO Goods_Card VALUES('직장인보너스카드', '신용카드', 5000000, '적립, 주유, 통신', '직장인, 350');

--Goods_Account--
INSERT INTO Goods_Account VALUES('직장인예금', '예금, 보통', 60000000, 0.001, null, '직장인', '이체 수수료 면제, 부가 서비스');
INSERT INTO Goods_Account VALUES('명지은행예금', '예금, 보통', 50000000, 0.001, null, '개인', '명지은행을 주거래 은행으로 사용시 수수료 면제');
INSERT INTO Goods_Account VALUES('명지사랑적금', '적금, 정기', 5000000, 0.025, 0.005, '개인', '자동이체 등록시 우대금리 적용');
INSERT INTO Goods_Account VALUES('대학생적금', '적금, 자유', 3500000, 0.039, 0.003, '대학생', '자동이체 등록시 우대금리 적용');
INSERT INTO Goods_Account VALUES('명지대출통장', '대출', 10000000, 0.03, 0.015, '개인', '신용점수 540이상');

--Customer--
INSERT INTO Customer VALUES('박초원', '991101-2222222', '경기도 용인시 처인구 명지로 116', to_date('01-11-1999','dd-mm-yyyy'), 'chowon@mju.ac.kr', '010-0000-0000', '학생', 253, to_date('06-06-2022','dd-mm-yyyy'));
INSERT INTO Customer VALUES('홍길동', '432002-1111111', '서울특별시 용산구 남산공원길 105', to_date('20-02-1443','dd-mm-yyyy'), 'gildong@naver.com', '010-1234-5678', '직장인', 420, to_date('04-08-2022', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('김영태', '821125-1011010', '인천광역시 연수구 송도동 52', to_date('25-11-1982', 'dd-mm-yyyy'), 'windmoon1125@naver.com', '010-1125-5252', '방송인', 980, to_date('25-11-2021','dd-mm-yyyy'));
INSERT INTO Customer VALUES('안희철', '980320-1110101', '경기도 용인시 처인구 명지로 113', to_date('20-03-1998', 'dd-mm-yyyy'), 'anhc49@mju.ac.kr', '010-3322-1100', '교수', 945, to_date('25-12-2021','dd-mm-yyyy'));
INSERT INTO Customer VALUES('현상원', '980307-1110001', '경기도 용인시 처인구 명지로 287', to_date('07-03-1998', 'dd-mm-yyyy'), 'shyun@mju.ac.kr', '010-4455-6677', '교수', 945, to_date('24-12-2021','dd-mm-yyyy'));
INSERT INTO Customer VALUES('이상혁', '010302-3111111', '경기도 용인시 처인구 포곡읍 199', to_date('02-03-2001', 'dd-mm-yyyy'), 'facker@naver.com', '010-9045-2211', '프로게이머', 632, to_date('02-06-2022', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('배주현', '910305-2081782', '경기도 용인시 처인구 명지로 10', to_date('05-03-1991', 'dd-mm-yyyy'), 'juhyun@mju.ac.kr', '010-1245-3214', '방송인', 209, to_date('20-11-2022', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('송하나', '990101-2876543', '경기도 용인시 처인구 명지로 42', to_date('02-02-1991', 'dd-mm-yyyy'), 'songhana@naver.com', '010-4325-4039', '학생', 104, to_date('24-08-2022', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('김수아', '881122-2222222', '경기도 용인시 처인구 포곡읍 202', to_date('22-11-1988', 'dd-mm-yyyy'), 'zzamtasooa@naver.com', '010-0987-6543', '방송인', 302, to_date('03-10-2021', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('김컴공', '010806-4222222','경기도 용인시 처인구 명지로 1103',to_date('06-08-2001', 'dd-mm-yyyy'),'computer@mju.ac.kr','010-1234-1234','학생', 264, to_date('05-05-2021', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('피카츄', '010228-3452615','경기도 용인시 처인구 태초로 24', to_date('28-02-2001', 'dd-mm-yyyy'),'pikachu@mju.ac.kr','010-4567-4567','학생', 764, to_date('02-10-2022', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('최수영', '020503-4444444','경기도 용인시 처인구 명지로 1105',to_date('03-05-2002', 'dd-mm-yyyy'),'sooyoung@mju.ac.kr','010-3456-3456','직장인', 546, to_date('04-06-2021', 'dd-mm-yyyy'));
INSERT INTO Customer VALUES('권미진', '010327-4112552','울산광역시 남구 팔등로 115',to_date('27-03-2002', 'dd-mm-yyyy'),'jusin1107@naver.com','010-0327-0327','학생', 674, to_date('27-11-2022', 'dd-mm-yyyy'));

--Account_List--
--<Deposite>
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '박초원', '991101-2222222', '804521-97-218432', 50000, to_date('06-06-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('직장인예금', '예금, 보통', '홍길동', '432002-1111111', '823456-34-938409', 1000000, to_date('04-08-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '김영태', '821125-1011010', '821125-52-038274', 3000000, to_date('25-11-2021', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '안희철', '980320-1110101', '847362-90-849382', 8000000, to_date('25-12-2021', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '이상혁', '010302-3111111', '894037-32-637284', 543000, to_date('02-06-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '배주현', '910305-2081782', '894758-42-382748', 54200, to_date('20-11-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '송하나', '990101-2876543', '890765-23-273628', 32400, to_date('24-08-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('직장인예금', '예금, 보통', '피카츄', '010228-3452615', '872910-43-485927', 100000, to_date('02-10-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지은행예금', '예금, 보통', '권미진', '010327-4112552', '847283-60-834523', 93000, to_date('27-11-2022', 'dd-mm-yyyy'));
--<Installment>
INSERT INTO Account_List VALUES('명지사랑적금', '적금, 정기', '홍길동', '432002-1111111', '894736-09-473826', 1545000, to_date('10-10-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지사랑적금', '적금, 정기', '김영태', '821125-1011010', '837264-30-482945', 6550000, to_date('31-12-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지사랑적금', '적금, 정기', '현상원', '980307-1110001', '829374-11-382948', 750000, to_date('20-01-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지사랑적금', '적금, 정기', '이상혁', '010302-3111111', '875658-32-372846', 65250000, to_date('30-08-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('대학생적금', '적금, 자유', '송하나', '990101-2876543', '875657-01-839479', 6825000, to_date('24-08-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('대학생적금', '적금, 자유', '김컴공', '010806-4222222', '887658-86-829384', 145000, to_date('05-05-2022', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('대학생적금', '적금, 자유', '권미진', '010327-4112552', '803074-17-394202', 200000, to_date('27-11-2022', 'dd-mm-yyyy'));
--<Loan>
INSERT INTO Account_List VALUES('명지대출통장', '대출', '김수아', '881122-2222222', '893748-02-938404', 3607000, to_date('03-10-2021', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지대출통장', '대출', '김컴공', '010806-4222222', '827384-12-837492', 2290000, to_date('10-10-2021', 'dd-mm-yyyy'));
INSERT INTO Account_List VALUES('명지대출통장', '대출', '최수영', '020503-4444444', '839228-09-394482', 522500, to_date('04-06-2021', 'dd-mm-yyyy'));

--Card_List--
--<check>
INSERT INTO Card_List VALUES('청년미래카드', '체크카드', '320-2930-482-1002', to_date('06-06-2026', 'dd-mm-yyyy'), '804521-97-218432', to_date('06-06-2022', 'dd-mm-yyyy'), 324500, 1000000, 'run', null);
INSERT INTO Card_List VALUES('청년미래카드', '체크카드', '310-2043-329-3940', to_date('04-08-2026', 'dd-mm-yyyy'), '823456-34-938409', to_date('04-08-2022', 'dd-mm-yyyy'), 245000, 1000000, 'stop', 'lost');
INSERT INTO Card_List VALUES('청년미래카드', '체크카드', '320-4829-483-4859', to_date('25-11-2025', 'dd-mm-yyyy'), '821125-52-038274', to_date('25-11-2025', 'dd-mm-yyyy'), 452350, 1000000, 'run', null);
INSERT INTO Card_List VALUES('교통서비스카드', '체크카드', '302-3829-485-9057', to_date('24-08-2026', 'dd-mm-yyyy'), '890765-23-273628', to_date('24-08-2022', 'dd-mm-yyyy'), 123620, 1000000, 'run', null);
INSERT INTO Card_List VALUES('교통서비스카드', '체크카드', '348-2849-384-2291', to_date('02-10-2026', 'dd-mm-yyyy'), '872910-43-485927', to_date('02-10-2022', 'dd-mm-yyyy'), 354890, 1000000, 'run', null);
INSERT INTO Card_List VALUES('청년미래카드', '체크카드', '327-2573-229-3940', to_date('27-11-2026', 'dd-mm-yyyy'), '847283-60-834523', to_date('27-11-2022', 'dd-mm-yyyy'), 0, 1000000, 'stop', 'lost');
--<credit>
INSERT INTO Card_List VALUES('반려동물사랑카드', '신용카드', '385-2839-472-4759', to_date('20-10-2026', 'dd-mm-yyyy'), '823456-34-938409', to_date('20-10-2022', 'dd-mm-yyyy'), 2045200, 5000000, 'run', null);
INSERT INTO Card_List VALUES('반려동물사랑카드', '신용카드', '345-2345-234-4533', to_date('30-05-2026', 'dd-mm-yyyy'), '821125-52-038274', to_date('30-05-2022', 'dd-mm-yyyy'), 523450, 5000000, 'run', null);
INSERT INTO Card_List VALUES('직장인보너스카드', '신용카드', '348-9859-023-4859', to_date('04-11-2026', 'dd-mm-yyyy'), '872910-43-485927', to_date('04-11-2022', 'dd-mm-yyyy'), 4256000, 5000000, 'run', null);
INSERT INTO Card_List VALUES('반려동물사랑카드', '신용카드', '327-2345-905-6723', to_date('27-11-2026', 'dd-mm-yyyy'), '847283-60-834523', to_date('27-11-2022', 'dd-mm-yyyy'), 3400000, 5000000, 'run', null);

--Automatic--
INSERT INTO Automatic VALUES('10C734GH', '823456-34-938409', '894736-09-473826', 50000, '매월, 25', null);
INSERT INTO Automatic VALUES('3DF890I2', '821125-52-038274', '837264-30-482945', 50000, '매월, 30', null);
INSERT INTO Automatic VALUES('456DF89F', '894037-32-637284', '875658-32-372846', 100000, '매월, 30', null);
INSERT INTO Automatic VALUES('289G678D', '890765-23-273628', '875657-01-839479', 10000, null, '매주, 일');
INSERT INTO Automatic VALUES('839DF09O', '847283-60-834523', '803074-17-394202', 200000, '매월, 1', null);

--Info_Installment--
INSERT INTO Info_Installment VALUES('894736-09-473826', '매월, 25', to_date('10-10-2027','dd-mm-yyyy'), 0.03, 24, 5000000, 'Y');
INSERT INTO Info_Installment VALUES('837264-30-482945', '매월, 30', to_date('31-12-2027','dd-mm-yyyy'), 0.03, 30, 5000000, 'N');
INSERT INTO Info_Installment VALUES('829374-11-382948', '매월, 1', to_date('20-01-2025','dd-mm-yyyy'), 0.025, 36, 5000000, 'Y');
INSERT INTO Info_Installment VALUES('875658-32-372846', '매월, 30', to_date('30-08-2026','dd-mm-yyyy'), 0.03, 25, 5000000, 'Y');
INSERT INTO Info_Installment VALUES('875657-01-839479', '매주, 일', to_date('24-08-2032','dd-mm-yyyy'), 0.042, 53, 3500000, 'Y');
INSERT INTO Info_Installment VALUES('887658-86-829384', '매주, 월', to_date('05-05-2027','dd-mm-yyyy'), 0.039, 20, 3500000, 'N');
INSERT INTO Info_Installment VALUES('803074-17-394202', '매월, 1', to_date('27-11-2025','dd-mm-yyyy'), 0.042, 1, 3500000, 'Y');

--Info_Deposite--
INSERT INTO Info_Deposite VALUES('804521-97-218432', 1, 5000000);
INSERT INTO Info_Deposite VALUES('823456-34-938409', 2, 6000000);
INSERT INTO Info_Deposite VALUES('821125-52-038274', 2, 5000000);
INSERT INTO Info_Deposite VALUES('847362-90-849382', 0, 5000000);
INSERT INTO Info_Deposite VALUES('894037-32-637284', 0, 5000000);
INSERT INTO Info_Deposite VALUES('894758-42-382748', 0, 5000000);
INSERT INTO Info_Deposite VALUES('890765-23-273628', 1, 5000000);
INSERT INTO Info_Deposite VALUES('872910-43-485927', 2, 5000000);

--Info_Loans--
INSERT INTO Info_Loans VALUES('893748-02-938404', 5000000, 150000, 1543000, 0.03);
INSERT INTO Info_Loans VALUES('827384-12-837492', 4500000, 135000, 2345000, 0.03);
INSERT INTO Info_Loans VALUES('839228-09-394482', 1500000, 22500, 1000000, 0.015);

--Detail_Transaction--
INSERT INTO Detail_Transaction VALUES('627D87S8', '310-2043-329-3940', 25000, '마트거래', to_date('02-09-2022', 'dd-mm-yyyy'), '03-293843-234523');
INSERT INTO Detail_Transaction VALUES('DF789J24', '385-2839-472-4759', 150000, '의료', to_date('25-11-2022', 'dd-mm-yyyy'), '02-873647-837482');

--Detail_Remittance--
INSERT INTO Detail_Remittance VALUES('432OP049', '823456-34-938409', '894736-09-473826', 50000, to_date('25-11-2020', 'dd-mm-yyyy'));
INSERT INTO Detail_Remittance VALUES('890DR6FG', '872910-43-485927', '821125-52-038274', 100000, to_date('20-10-2022', 'dd-mm-yyyy'));

----
commit;


--확인--
select * from Goods_Card;
select * from Goods_Account;
select * from Customer;
select * from Account_List;
select * from Card_List;
select * from Automatic;
select * from Info_Installment;
select * from Info_Deposite;
select * from Info_Loans;
select * from Detail_Transaction;
select * from Detail_Remittance;

--지우기--
delete Detail_Remittance;
delete Detail_Transaction;
delete Info_Loans;
delete Info_Deposite;
delete Info_Installment;
delete Automatic;
delete Card_List;
delete Account_List;
delete Customer;
delete Goods_Account;
delete Goods_Card;