INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (1, null, null, null, null, '123', 'admin');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (2, null, null, null, null, '123', 'admin1');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (3, null, null, null, null, '123', 'user');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (4, null, null, null, null, '123', 'user1');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (5, null, null, null, null, '123', 'leader');
INSERT INTO t_sec_user (id, accountNonExpired, accountNonLocked, credentialsNonExpired, enables, password, username) VALUES (6, null, null, null, null, '123', 'leader1');



INSERT INTO t_sec_role (id, description, enables, name) VALUES (1, '管理员', null, 'ROLE_ADMIN');
INSERT INTO t_sec_role (id, description, enables, name) VALUES (2, '用户', null, 'ROLE_USER');
INSERT INTO t_sec_role (id, description, enables, name) VALUES (3, '领导', null, 'ROLE_LEADER');


INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (1, '主界面资源', null, 'HOMEUI', null, '/home/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (2, '用户界面资源', null, 'USERUI', null, '/user/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (3, '论坛界面资源', null, 'FORUM', null, '/forum/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (4, '地图界面资源', null, 'MAP', null, '/map/*');
INSERT INTO t_sec_resources (id, description, enables, name, type, url) VALUES (5, '地图管理', null, 'MAP UPDATE', null, '/mapup/*');


INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (1, '基本权限', null, 'BASE');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (2, '论坛权限', null, 'FORUM');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (3, '地图修改权限', null, 'MAPMODIFY');
INSERT INTO t_sec_authorities (id, description, enables, name) VALUES (4, '用户管理权限', null, 'USERMANAGER');


INSERT INTO t_sec_user_t_sec_role (T_SEC_USER_id, roles_id) VALUES (1, 1);
INSERT INTO t_sec_user_t_sec_role (T_SEC_USER_id, roles_id) VALUES (3, 2);

INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 1);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 2);
INSERT INTO t_sec_role_t_sec_authorities (T_SEC_ROLE_id, authorities_id) VALUES (1, 4);

INSERT INTO t_sec_authorities_t_sec_resources (T_SEC_AUTHORITIES_id, resources_id) VALUES (1, 1);


