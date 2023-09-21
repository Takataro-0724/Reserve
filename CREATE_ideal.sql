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
INSERT into ideal.menuType VALUES(100,'�R�[�X');
INSERT into ideal.menuType VALUES(200,'�O��');
INSERT into ideal.menuType VALUES(210,'�X�[�v');
INSERT into ideal.menuType VALUES(220,'�p�X�^');
INSERT into ideal.menuType VALUES(300,'������');
INSERT into ideal.menuType VALUES(310,'������');
INSERT into ideal.menuType VALUES(400,'�f�U�[�g');
INSERT into ideal.menuType VALUES(700,'���C��');
INSERT into ideal.menuType VALUES(710,'�A���R�[����');
INSERT into ideal.menuType VALUES(720,'�\�t�g�h�����N��');
INSERT into ideal.menuType VALUES(900,'���̑�');

INSERT INTO ideal.course VALUES(DEFAULT ,'A�R�[�X�i���������j','�ŏ㋉�̐_�ˋ������C���̃R�[�X�ł�',DEFAULT,12000,100);
INSERT INTO ideal.course VALUES(DEFAULT ,'B�R�[�X�i���������j','�^�����R�N�̂���\�[�X���u�߂܂���',DEFAULT,10000,100);
INSERT INTO ideal.course VALUES(DEFAULT ,'C�R�[�X�i������j','�ɐ��C�V�����C���̃R�[�X�ł�',DEFAULT,12000,100);

INSERT INTO ideal.menu VALUES(DEFAULT ,'�t�H�A�O���̃��[�X�g','�O�咿���̂ЂƂt�H�A�O�������[�X�g���܂���',DEFAULT,3000,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�I�}�[���G�r�̃T���_','�n���C�̃I�}�[���G�r����������h���b�V���O��',DEFAULT,1800,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'���n���ƃT���~�̐��荇�킹','�C�^���A���ȃn���ƃ\�[�Z�[�W',DEFAULT,2100,200);
INSERT INTO ideal.menu VALUES(DEFAULT ,'���b�c�@���b���`�[�Y�̃g�}�g�\�[�X','�C�^���A���`�[�Y�͂�����',DEFAULT,1800,200);

INSERT INTO ideal.menu VALUES(DEFAULT ,'�R�[���N���[���X�[�v',NULL,DEFAULT,800,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�I�j�I���O���^���X�[�v','�Ƃ낯��I�j�I��',DEFAULT,1200,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�J���u�C���N�����`���E�_�[',NULL,DEFAULT,1000,210);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�R���\���X�[�v',NULL,DEFAULT,800,210);

INSERT INTO ideal.menu VALUES(DEFAULT ,'�����q�̃p�X�^','��B�̖����q���ґ�Ɏg���܂���',DEFAULT,2100,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�y�X�J�g�[���n���C��',NULL,DEFAULT,1800,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�g�}�g�ƃo�W���R�̃p�X�^�W�F�m�o��','�C�^���A���X�p�C�V�[�ȃp�X�^',DEFAULT,1600,220);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�~�[�g�{�[���i�|�����g�}�g�\�[�X',NULL,DEFAULT,1600,220);

INSERT INTO ideal.menu VALUES(DEFAULT ,'�����̃\�e�[',NULL,DEFAULT,3800,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�a���̃T�[���C���X�e�[�L','���I�����_�ˋ��̂Ƃ낯�閡�킢',DEFAULT,4800,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�q�r�̒Y�Ă��X�y�A���u','�������肵���q�r��������',DEFAULT,3200,300);
INSERT INTO ideal.menu VALUES(DEFAULT ,'���[�X�g�r�[�t�p���~�W���[�m�Y��',NULL,DEFAULT,3800,300);


INSERT INTO ideal.menu VALUES(DEFAULT ,'��̃\����','���˓��C�̑����������d�グ�܂���',DEFAULT,2800,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�㕽�ڂ̃��j�G��','���g���̉��l�q���������Ɛ��o�^�[�ŏĂ��グ�܂���',DEFAULT,3200,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�T�[�����X�e�[�L','�k�C���Y�̃T�[�������������I���܂���',DEFAULT,2500,310);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�ɐ��C�V�̃��[�X�g',NULL,DEFAULT,3400,310);

INSERT INTO ideal.menu VALUES(DEFAULT ,'�����A�C�X�N���[��',NULL,DEFAULT,800,400);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�K�g�[�V���R��','�Â���}�����C�^���A���ȃf�U�[�g',DEFAULT,700,400);
INSERT INTO ideal.menu VALUES(DEFAULT ,'�m�i�V�̃[���[',NULL,DEFAULT,800,400);

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

INSERT INTO ideal.user VALUES(DEFAULT,'�e�X�g',PASSWORD('test'),'','','','�e�X�g���');

	
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


INSERT INTO ideal.table_loc VALUES(1,'���[�}',4);
INSERT INTO ideal.table_loc VALUES(2,'�t�B�����c�F',4);
INSERT INTO ideal.table_loc VALUES(3,'�~���m',4);
INSERT INTO ideal.table_loc VALUES(4,'���F�j�X',4);
INSERT INTO ideal.table_loc VALUES(5,'�i�|��',4);
INSERT INTO ideal.table_loc VALUES(6,'���[�h�X',6);
INSERT INTO ideal.table_loc VALUES(7,'�V�`���A',6);

CREATE TABLE ideal.admin(
	adm_name 		varchar(30) NOT NULL,
	password 		varchar(64) NOT NULL,
	exp 			text,
	PRIMARY KEY(adm_name, password)
);

INSERT INTO ideal.admin VALUES('admin',PASSWORD('admin'),'�Ǘ���');