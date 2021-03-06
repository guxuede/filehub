DROP TABLE person;
CREATE TABLE person (id bigint NOT NULL AUTO_INCREMENT, firstName varchar(255), lastName varchar(255), address varchar(255), age varchar(255), email varchar(255), mobile varchar(255), money decimal(19,2), phone varchar(255), qq varchar(255), sex int, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO person (id, firstName, lastName, address, age, email, mobile, money, phone, qq, sex) VALUES (1, '88', '', '', '', '', '', 0.00, '', '', null);
INSERT INTO person (id, firstName, lastName, address, age, email, mobile, money, phone, qq, sex) VALUES (2, '', '', '', '', '', '888', 0.00, '', '', null);
INSERT INTO person (id, firstName, lastName, address, age, email, mobile, money, phone, qq, sex) VALUES (3, '', '', '', '', '', '', 23.00, '2', '3', 0);
INSERT INTO person (id, firstName, lastName, address, age, email, mobile, money, phone, qq, sex) VALUES (4, '123', '23', '1', '1', '', '1', 1.00, '1', '1', 1);
INSERT INTO person (id, firstName, lastName, address, age, email, mobile, money, phone, qq, sex) VALUES (5, '1', '1', '1', '1', '1', '1', 1.00, '1', '1', 1);
DROP TABLE t_sec_authorities;
CREATE TABLE t_sec_authorities (id bigint NOT NULL AUTO_INCREMENT, description varchar(255), enables bit, name varchar(255), PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (1, '基本权限', true, 'BASE');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (2, '论坛权限', false, 'FORUM');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (3, '地图修改权限', null, 'MAPMODIFY');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (4, '用户管理权限', null, 'USERMANAGER');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (5, '撒网松岛枫', true, 'Comparator');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (6, '权限管理中的资源管理', true, 'AuthorityResourceManager');
DROP TABLE t_sec_authorities_t_sec_resources;
CREATE TABLE t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id bigint NOT NULL, resources_id bigint NOT NULL, PRIMARY KEY (T_SEC_AUTHORITIES_id, resources_id), INDEX FKEF8CAB55B6834385 (T_SEC_AUTHORITIES_id), INDEX FKEF8CAB55842B9364 (resources_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (1, 1);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (1, 2);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (1, 3);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (2, 3);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (2, 4);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (5, 2);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (5, 3);
INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (6, 6);
DROP TABLE t_sec_resources;
CREATE TABLE t_sec_resources (id bigint NOT NULL AUTO_INCREMENT, description varchar(255), enables bit, name varchar(255), type varchar(255), url varchar(255), PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (1, '主界面资源', false, 'HOMEUI', '', '/home/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (2, '用户界面资源', null, 'USERUI', null, '/user/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (3, '论坛界面资源', null, 'FORUM', null, '/forum/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (4, '地图界面资源', null, 'MAP', null, '/map/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (5, '地图管理', null, 'MAP UPDATE', null, '/mapup/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (6, '权限管理的资源管理', true, 'security-resource', '', '/admin/security/resource*/*');
DROP TABLE t_sec_role;
CREATE TABLE t_sec_role (id bigint NOT NULL AUTO_INCREMENT, description varchar(255), enables bit, name varchar(255), PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_role (id, description, enables, name) VALUES (1, '管理员', false, 'ROLE_ADMIN');
INSERT INTO t_sec_role (id, description, enables, name) VALUES (2, '用户', null, 'ROLE_USER');
INSERT INTO t_sec_role (id, description, enables, name) VALUES (3, '领导', false, 'ROLE_LEADER');
INSERT INTO t_sec_role (id, description, enables, name) VALUES (4, '新来的', true, 'ROLE_NEWGUY');
DROP TABLE t_sec_role_t_sec_authorities;
CREATE TABLE t_sec_role_t_sec_authorities (T_SEC_ROLE_id bigint NOT NULL, authorities_id bigint NOT NULL, PRIMARY KEY (T_SEC_ROLE_id, authorities_id), INDEX FK87D109386CB40B22 (T_SEC_ROLE_id), INDEX FK87D10938BA91742C (authorities_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 1);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 2);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 4);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (2, 2);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (2, 3);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (3, 3);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (3, 6);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (4, 1);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (4, 3);
DROP TABLE t_sec_user;
CREATE TABLE t_sec_user (id bigint NOT NULL AUTO_INCREMENT, accountNonExpired bit, accountNonLocked bit, credentialsNonExpired bit, enables bit, password varchar(255), username varchar(255), PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (1, null, null, null, null, '123', 'admin');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (2, null, null, null, null, '123', 'admin1');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (3, null, null, null, null, '123', 'user');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (4, null, null, null, null, '123', 'user1');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (5, null, null, null, null, '123', 'leader');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (6, null, null, null, null, '123', 'leader1');
DROP TABLE t_sec_user_t_sec_role;
CREATE TABLE t_sec_user_t_sec_role (T_SEC_USER_id bigint NOT NULL, roles_id bigint NOT NULL, PRIMARY KEY (T_SEC_USER_id, roles_id), CONSTRAINT roles_id UNIQUE (roles_id), INDEX FK39819BCA11DECF02 (T_SEC_USER_id), INDEX FK39819BCAF5C4B0B4 (roles_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO t_sec_user_t_sec_role (T_SEC_USER_id, roles_id) VALUES (1, 1);
INSERT INTO t_sec_user_t_sec_role (T_SEC_USER_id, roles_id) VALUES (3, 2);
ALTER TABLE t_sec_authorities_t_sec_resources ADD CONSTRAINT FKEF8CAB55842B9364 FOREIGN KEY (resources_id) REFERENCES t_sec_resources (id) ;
ALTER TABLE t_sec_authorities_t_sec_resources ADD CONSTRAINT FKEF8CAB55B6834385 FOREIGN KEY (T_SEC_AUTHORITIES_id) REFERENCES t_sec_authorities (id);
ALTER TABLE t_sec_role_t_sec_authorities ADD CONSTRAINT FK87D109386CB40B22 FOREIGN KEY (T_SEC_ROLE_id) REFERENCES t_sec_role (id) ;
ALTER TABLE t_sec_role_t_sec_authorities ADD CONSTRAINT FK87D10938BA91742C FOREIGN KEY (authorities_id) REFERENCES t_sec_authorities (id);
ALTER TABLE t_sec_user_t_sec_role ADD CONSTRAINT FK39819BCA11DECF02 FOREIGN KEY (T_SEC_USER_id) REFERENCES t_sec_user (id) ;
ALTER TABLE t_sec_user_t_sec_role ADD CONSTRAINT FK39819BCAF5C4B0B4 FOREIGN KEY (roles_id) REFERENCES t_sec_role (id);
