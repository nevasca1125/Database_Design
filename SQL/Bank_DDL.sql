CREATE table Goods_Card(
    title VARCHAR(20),
    type VARCHAR(10),
    limit NUMBER,
    benefit VARCHAR(100),
    target VARCHAR(20),
    PRIMARY KEY (title, type)
);

CREATE table Goods_Account(
    title VARCHAR(20),
    type VARCHAR(10),
    limit NUMBER,
    rate_interest NUMBER,
    interset_prefer NUMBER,
    target VARCHAR(20),
    content VARCHAR(100),
    PRIMARY KEY (title, type)
);

CREATE table Customer(
    name VARCHAR(10),
    num_resident VARCHAR(15),
    address VARCHAR(50),
    date_birth DATE,
    email VARCHAR(50),
    phone VARCHAR(50),
    job VARCHAR(10),
    rate_credit NUMBER,
    date_join DATE,
    PRIMARY KEY (name, num_resident)
);

CREATE table Account_List(
    title VARCHAR(20),
    type VARCHAR(10),
    owner VARCHAR(10),
    num_resident VARCHAR(15),
    account VARCHAR(20),
    balance NUMBER,
    date_create DATE,
    PRIMARY KEY (account),
    FOREIGN KEY (title, type) REFERENCES Goods_Account(title, type),
    FOREIGN KEY (owner, num_resident) REFERENCES Customer(name, num_resident) 
);

CREATE table Card_List(
    title VARCHAR(20),
    type VARCHAR(10),
    num_card VARCHAR(20),
    date_expiration DATE,
    account VARCHAR(20),
    date_create DATE,
    cumulative NUMBER,
    limit NUMBER,
    state VARCHAR(5),
    reason VARCHAR(10),
    PRIMARY KEY (num_card),
    FOREIGN KEY (title, type) REFERENCES Goods_Card(title, type),
    FOREIGN KEY (account) REFERENCES Account_List(account)
);

CREATE table Detail_Transaction(
    number_transaction VARCHAR(15),
    card VARCHAR(20),
    amount NUMBER,
    breakdown VARCHAR(15),
    date_trans DATE,
    account_dest VARCHAR(20),
    PRIMARY KEY (number_transaction),
    FOREIGN KEY (card) REFERENCES Card_List(num_card),
    FOREIGN KEY (account_dest) REFERENCES Account_List(account)
);

CREATE table Detail_Remittance(
    number_remittance VARCHAR(15),
    account_src VARCHAR(20),
    account_dest VARCHAR(20),
    amount NUMBER,
    date_remit DATE,
    PRIMARY KEY (number_remittance),
    FOREIGN KEY (account_src) REFERENCES Account_List(account),
    FOREIGN KEY (account_dest) REFERENCES Account_List(account)
);

CREATE table Automatic(
    number_automatic VARCHAR(15),
    account_src VARCHAR(20),
    account_dest VARCHAR(20),
    amount NUMBER,
    date_send DATE,
    day_send VARCHAR(5),
    PRIMARY KEY (number_automatic),
    FOREIGN KEY (account_src) REFERENCES Account_List(account),
    FOREIGN KEY (account_dest) REFERENCES Account_List(account)
);

CREATE table Info_Installment(
    account VARCHAR(20),
    date_payment NUMBER,
    date_expiration DATE,
    rate_interest NUMBER,
    number_payment NUMBER,
    limit_payment NUMBER,
    extension VARCHAR(5),
    PRIMARY KEY (account),
    FOREIGN KEY (account) REFERENCES Account_List(account)
);

CREATE table Info_Deposite(
    account VARCHAR(20),
    number_card NUMBER,
    limit NUMBER,
    PRIMARY KEY (account),
    FOREIGN KEY (account) REFERENCES Account_List(account)
);

CREATE table Info_Loans(
    account VARCHAR(20),
    principal NUMBER,
    interest NUMBER,
    redemption NUMBER,
    rate_interest NUMBER,
    PRIMARY KEY (account),
    FOREIGN KEY (account) REFERENCES Account_List(account)
);

Drop table Goods_Account;
Drop table Goods_Card;
Drop table Customer;
Drop table Account_List;
Drop table Card_List;
Drop table Detail_Transaction;
Drop table Detail_Remittance;
Drop table Automatic;
Drop table Info_Installment;
Drop table Info_Deposite;
Drop table Info_Loans;