CREATE DATABASE ideal;

CREATE TABLE ideal.menuType(
	t_id 		smallint,
	t_name 		varchar(30),
	PRIMARY KEY(t_id)
);
CREATE TABLE ideal.menu(
	m_id 		integer auto_increment PRIMARY KEY,
	m_name 		varchar(100) NOT NULL,
	detail 		text,
	orderFlg 	tinyint DEFAULT 1,
	price 		int NOT NULL,
	t_id 		smallint NOT NULL,
	FOREIGN KEY(t_id) REFERENCES ideal.menuType(t_id)
);
CREATE TABLE ideal.course(
    	c_id		INT AUTO_INCREMENT PRIMARY KEY,
    	c_name 		VARCHAR(30) NOT NULL,
    	detail 		text,
    	orderFlg 	tinyint DEFAULT 1,
    	price 		int NOT NULL,
	t_id 		smallint NOT NULL,
	FOREIGN KEY(t_id) REFERENCES ideal.menuType(t_id)
);
CREATE TABLE ideal.coursectl(
	c_id 		integer,
	m_id 		integer,
	FOREIGN KEY (m_id) REFERENCES ideal.menu(m_id),
	FOREIGN KEY (c_id) REFERENCES ideal.course(c_id)
);
INSERT into ideal.menuType VALUES(100,'コース');
INSERT into ideal.menuType VALUES(200,'前菜');
INSERT into ideal.menuType VALUES(210,'スープ');
INSERT into ideal.menuType VALUES(220,'パスタ');
INSERT into ideal.menuType VALUES(300,'肉料理');
INSERT into ideal.menuType VALUES(310,'魚料理');
INSERT into ideal.menuType VALUES(400,'デザート');
INSERT into ideal.menuType VALUES(700,'ワイン');
INSERT into ideal.menuType VALUES(710,'アルコール類');
INSERT into ideal.menuType VALUES(720,'ソフトドリンク類');
INSERT into ideal.menuType VALUES(900,'その他');

INSERT INTO ideal.course VALUES(DEFAULT ,'Aコース（牛肉料理）','最上級の神戸牛がメインのコースです',DEFAULT,12000,100);
INSERT INTO ideal.course VALUES(DEFAULT ,'Bコース（鳥肉料理）','真鴨をコクのあるソースで炒めました',DEFAULT,10000,100);
INSERT INTO ideal.course VALUES(DEFAULT ,'Cコース（魚介料理）','伊勢海老がメインのコースです',DEFAULT,12000,100);

INSERT INTO ideal.menu VALUES(DEFAULT ,'フォアグラのロースト','三大珍味のひとつフォアグラをローストしました',DEFAULT,3000,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'オマールエビのサラダ','地中海のオマールエビをあっさりドレッシングで',DEFAULT,1800,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'生ハムとサラミの盛り合わせ','イタリアンなハムとソーセージ',DEFAULT,2100,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'モッツァレッラチーズのトマトソース','イタリアンチーズはいかが',DEFAULT,1800,200);

INSERT INTO ideal.menu VALUES(DEFAULT ,'コーンクリームスープ',NULL,DEFAULT,800,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'オニオングラタンスープ','とろけるオニオン',DEFAULT,1200,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'カリブ海風クラムチャウダー',NULL,DEFAULT,1000,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'コンソメスープ',NULL,DEFAULT,800,210);

INSERT INTO ideal.menu VALUES(DEFAULT ,'明太子のパスタ','九州の明太子を贅沢に使いました',DEFAULT,2100,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'ペスカトーレ地中海風',NULL,DEFAULT,1800,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'トマトとバジリコのパスタジェノバ風','イタリアンスパイシーなパスタ',DEFAULT,1600,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'ミートボールナポリ風トマトソース',NULL,DEFAULT,1600,220);

INSERT INTO ideal.menu VALUES(DEFAULT ,'鴨肉のソテー',NULL,DEFAULT,3800,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'和牛のサーロインステーキ','厳選した神戸牛のとろける味わい',DEFAULT,4800,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'子羊の炭焼きスペアリブ','あっさりした子羊を骨つきで',DEFAULT,3200,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'ローストビーフパルミジャーノ添え',NULL,DEFAULT,3800,300);


INSERT INTO ideal.menu VALUES(DEFAULT ,'鯛のソワレ','瀬戸内海の鯛をあっさり仕上げました',DEFAULT,2800,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'舌平目のムニエル','白身魚の王様ヒラメを自家製バターで焼き上げました',DEFAULT,3200,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'サーモンステーキ','北海道産のサーモンだけを厳選しました',DEFAULT,2500,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'伊勢海老のロースト',NULL,DEFAULT,3400,310);

INSERT INTO ideal.menu VALUES(DEFAULT ,'抹茶アイスクリーム',NULL,DEFAULT,800,400);
INSERT INTO ideal.menu VALUES(DEFAULT ,'ガトーショコラ','甘さを抑えたイタリアンなデザート',DEFAULT,700,400);
INSERT INTO ideal.menu VALUES(DEFAULT ,'洋ナシのゼリー',NULL,DEFAULT,800,400);

INSERT INTO ideal.coursectl VALUES(1,1);
INSERT INTO ideal.coursectl VALUES(1,6);
INSERT INTO ideal.coursectl VALUES(1,14);
INSERT INTO ideal.coursectl VALUES(1,22);

INSERT INTO ideal.coursectl VALUES(2,2);
INSERT INTO ideal.coursectl VALUES(2,7);
INSERT INTO ideal.coursectl VALUES(2,13);
INSERT INTO ideal.coursectl VALUES(2,23);

INSERT INTO ideal.coursectl VALUES(3,2);
INSERT INTO ideal.coursectl VALUES(3,7);
INSERT INTO ideal.coursectl VALUES(3,10);
INSERT INTO ideal.coursectl VALUES(3,20);
INSERT INTO ideal.coursectl VALUES(3,21);

CREATE TABLE ideal.user(
	usr_id	int AUTO_INCREMENT PRIMARY KEY,
	usr_name 		varchar(30) NOT NULL,
	password 		varchar(64) NOT NULL,
	address 		varchar(200),
	phone 			varchar(20),
	mail 			varchar(100),
	exp 			text
);

INSERT INTO ideal.user VALUES(DEFAULT,'テスト',PASSWORD('test'),'','','','テスト会員');

	
CREATE TABLE ideal.table_loc(
	table_id 		tinyint PRIMARY KEY,
	table_name 		varchar(30),
	max_capacity 		tinyint
);

CREATE TABLE ideal.reserve(
	rsv_id 			int AUTO_INCREMENT PRIMARY KEY,
	usr_id 			int NOT NULL,
	rsv_date 		datetime NOT NULL,
	person 			tinyint NOT NULL,
	table_id 		tinyint,
	c_id 			int,
	app_date 		timestamp ,
	FOREIGN KEY(usr_id) REFERENCES ideal.user(usr_id),
	FOREIGN KEY(c_id) REFERENCES ideal.course(c_id),
	FOREIGN KEY(table_id) REFERENCES ideal.table_loc(table_id)
);


INSERT INTO ideal.table_loc VALUES(1,'ローマ',4);
INSERT INTO ideal.table_loc VALUES(2,'フィレンツェ',4);
INSERT INTO ideal.table_loc VALUES(3,'ミラノ',4);
INSERT INTO ideal.table_loc VALUES(4,'ヴェニス',4);
INSERT INTO ideal.table_loc VALUES(5,'ナポリ',4);
INSERT INTO ideal.table_loc VALUES(6,'ロードス',6);
INSERT INTO ideal.table_loc VALUES(7,'シチリア',6);

CREATE TABLE ideal.admin(
	adm_name 		varchar(30) NOT NULL,
	password 		varchar(64) NOT NULL,
	exp 			text,
	PRIMARY KEY(adm_name, password)
);

INSERT INTO ideal.admin VALUES('admin',PASSWORD('admin'),'管理者');