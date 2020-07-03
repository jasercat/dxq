/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/3 19:21:03                            */
/*==============================================================*/


drop table if exists discount_inf;

drop table if exists tbl_admininfo;

drop table if exists tbl_cbrecommend;

drop table if exists tbl_cookbookinfo;

drop table if exists tbl_discountticketinfo;

drop table if exists tbl_fd_fc;

drop table if exists tbl_flashbuy;

drop table if exists tbl_flashclassify;

drop table if exists tbl_flasheva;

drop table if exists tbl_flashinfo;

drop table if exists tbl_flashorder;

drop table if exists tbl_orderinfo;

drop table if exists tbl_promoteinfo;

drop table if exists tbl_useraddr;

drop table if exists tbl_userinfo;

/*==============================================================*/
/* Table: discount_inf                                          */
/*==============================================================*/
create table discount_inf
(
   dis_inf_id           int not null,
   dis_inf_content      varchar(50) not null,
   leastgoods_number    int not null,
   order_discount       float not null,
   dis_beginTime        datetime,
   dis_endTime          datetime,
   primary key (dis_inf_id)
);

/*==============================================================*/
/* Table: tbl_admininfo                                         */
/*==============================================================*/
create table tbl_admininfo
(
   admin_id             int not null,
   admin_name           varchar(20) not null,
   admin_pwd            varchar(20) not null,
   primary key (admin_id)
);

/*==============================================================*/
/* Table: tbl_cbrecommend                                       */
/*==============================================================*/
create table tbl_cbrecommend
(
   flash_id             int not null,
   cookbook_id          int not null,
   recommend_detail     varchar(100),
   primary key (flash_id, cookbook_id)
);

/*==============================================================*/
/* Table: tbl_cookbookinfo                                      */
/*==============================================================*/
create table tbl_cookbookinfo
(
   cookbook_id          int not null,
   cookbook_name        varchar(50) not null,
   cookbook_material    varchar(50) not null,
   cookbook_step        varchar(50) not null,
   cookbook_img         longblob not null,
   primary key (cookbook_id)
);

/*==============================================================*/
/* Table: tbl_discountticketinfo                                */
/*==============================================================*/
create table tbl_discountticketinfo
(
   discountticket_id    int not null,
   order_id             int,
   discountticket_detail varchar(50) not null,
   need_reachprice      float not null,
   discount_money       float not null,
   ds_start_time        datetime,
   ds_end_time          datetime,
   primary key (discountticket_id)
);

/*==============================================================*/
/* Table: tbl_fd_fc                                             */
/*==============================================================*/
create table tbl_fd_fc
(
   dis_inf_id           int not null,
   flash_id             int not null,
   start_time           datetime not null,
   end_time             datetime not null,
   primary key (dis_inf_id, flash_id)
);

/*==============================================================*/
/* Table: tbl_flashbuy                                          */
/*==============================================================*/
create table tbl_flashbuy
(
   flashbuy_id          int not null,
   admin_id             int,
   buyfrash_num         int not null,
   flashbuy_state       varchar(50) not null,
   primary key (flashbuy_id)
);

/*==============================================================*/
/* Table: tbl_flashclassify                                     */
/*==============================================================*/
create table tbl_flashclassify
(
   classify_id          int not null,
   classify_name        varchar(20) not null,
   classify_detail      varchar(100) not null,
   primary key (classify_id)
);

/*==============================================================*/
/* Table: tbl_flasheva                                          */
/*==============================================================*/
create table tbl_flasheva
(
   flash_id             int not null,
   user_id              int not null,
   eva_detail           varchar(100) not null,
   eva_time             datetime not null,
   star                 int not null,
   eva_photo            longblob not null,
   primary key (flash_id, user_id)
);

/*==============================================================*/
/* Table: tbl_flashinfo                                         */
/*==============================================================*/
create table tbl_flashinfo
(
   flash_id             int not null,
   flashbuy_id          int,
   classify_id          int,
   promote_id           int,
   flash_name           varchar(20) not null,
   flash_price          float not null,
   flash_vipprice       float not null,
   flash_num            int not null,
   flash_size           float not null,
   dflash_detailetail   varchar(100) not null,
   primary key (flash_id)
);

/*==============================================================*/
/* Table: tbl_flashorder                                        */
/*==============================================================*/
create table tbl_flashorder
(
   order_id             int not null,
   address_id           int,
   user_id              int,
   discountticket_id    int,
   origin_price         float not null,
   practical_price      float not null,
   need_reachtime       datetime not null,
   order_state          varchar(50) not null,
   primary key (order_id)
);

/*==============================================================*/
/* Table: tbl_orderinfo                                         */
/*==============================================================*/
create table tbl_orderinfo
(
   order_id             int not null,
   flash_id             int not null,
   dis_inf_id           int not null,
   full_discount        int not null,
   total_price          float not null,
   order_discount       float not null,
   primary key (order_id, flash_id, dis_inf_id)
);

/*==============================================================*/
/* Table: tbl_promoteinfo                                       */
/*==============================================================*/
create table tbl_promoteinfo
(
   promote_id           int not null,
   flash_id             int,
   promote_price        float not null,
   promote_num          int not null,
   p_start_time         datetime,
   p_end_time           datetime,
   primary key (promote_id)
);

/*==============================================================*/
/* Table: tbl_useraddr                                          */
/*==============================================================*/
create table tbl_useraddr
(
   address_id           int not null,
   order_id             int,
   user_id              int,
   addr_psa             varchar(50) not null,
   region               varchar(50) not null,
   connect_person       varchar(20) not null,
   connectp_phonenum    varchar(20) not null,
   primary key (address_id)
);

/*==============================================================*/
/* Table: tbl_userinfo                                          */
/*==============================================================*/
create table tbl_userinfo
(
   user_id              int not null,
   user_name            varchar(50) not null,
   user_sex             varchar(10) not null,
   user_pwd             varchar(20) not null,
   user_phonenum        varchar(20) not null,
   user_email           varchar(50) not null,
   user_city            varchar(20) not null,
   user_registertime    datetime,
   user_vip             bool not null,
   user_viptime         datetime,
   primary key (user_id)
);

alter table tbl_cbrecommend add constraint FK_tbl_cbrecommend foreign key (flash_id)
      references tbl_flashinfo (flash_id) on delete restrict on update restrict;

alter table tbl_cbrecommend add constraint FK_tbl_cbrecommend2 foreign key (cookbook_id)
      references tbl_cookbookinfo (cookbook_id) on delete restrict on update restrict;

alter table tbl_discountticketinfo add constraint FK_使用2 foreign key (order_id)
      references tbl_flashorder (order_id) on delete restrict on update restrict;

alter table tbl_fd_fc add constraint FK_tbl_fd_fc foreign key (dis_inf_id)
      references discount_inf (dis_inf_id) on delete restrict on update restrict;

alter table tbl_fd_fc add constraint FK_tbl_fd_fc2 foreign key (flash_id)
      references tbl_flashinfo (flash_id) on delete restrict on update restrict;

alter table tbl_flashbuy add constraint FK_Relationship_7 foreign key (admin_id)
      references tbl_admininfo (admin_id) on delete restrict on update restrict;

alter table tbl_flasheva add constraint FK_tbl_flasheva foreign key (flash_id)
      references tbl_flashinfo (flash_id) on delete restrict on update restrict;

alter table tbl_flasheva add constraint FK_tbl_flasheva2 foreign key (user_id)
      references tbl_userinfo (user_id) on delete restrict on update restrict;

alter table tbl_flashinfo add constraint FK_Relationship_1 foreign key (classify_id)
      references tbl_flashclassify (classify_id) on delete restrict on update restrict;

alter table tbl_flashinfo add constraint FK_订购 foreign key (flashbuy_id)
      references tbl_flashbuy (flashbuy_id) on delete restrict on update restrict;

alter table tbl_flashinfo add constraint FK_限时促销 foreign key (promote_id)
      references tbl_promoteinfo (promote_id) on delete restrict on update restrict;

alter table tbl_flashorder add constraint FK_使用 foreign key (discountticket_id)
      references tbl_discountticketinfo (discountticket_id) on delete restrict on update restrict;

alter table tbl_flashorder add constraint FK_拥有 foreign key (user_id)
      references tbl_userinfo (user_id) on delete restrict on update restrict;

alter table tbl_flashorder add constraint FK_配送 foreign key (address_id)
      references tbl_useraddr (address_id) on delete restrict on update restrict;

alter table tbl_orderinfo add constraint FK_tbl_orderinfo foreign key (order_id)
      references tbl_flashorder (order_id) on delete restrict on update restrict;

alter table tbl_orderinfo add constraint FK_tbl_orderinfo2 foreign key (flash_id)
      references tbl_flashinfo (flash_id) on delete restrict on update restrict;

alter table tbl_orderinfo add constraint FK_tbl_orderinfo3 foreign key (dis_inf_id)
      references discount_inf (dis_inf_id) on delete restrict on update restrict;

alter table tbl_promoteinfo add constraint FK_限时促销2 foreign key (flash_id)
      references tbl_flashinfo (flash_id) on delete restrict on update restrict;

alter table tbl_useraddr add constraint FK_设置 foreign key (user_id)
      references tbl_userinfo (user_id) on delete restrict on update restrict;

alter table tbl_useraddr add constraint FK_配送2 foreign key (order_id)
      references tbl_flashorder (order_id) on delete restrict on update restrict;

