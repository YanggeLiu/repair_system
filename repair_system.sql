
-- create database;

create database repair_system;

-- create tables

create table com_info(
    com_id varchar(10) not null,
    com_name varchar(20) not null,
    com_price float not null,
    com_color varchar(10) not null,
    primary key(com_id)
);

create table user_info(
    user_id varchar(10) not null,
    user_name varchar(8) not null,
    user_sex enum('男','女'),
    user_phone varchar(11),
    user_email varchar(20) not null,
    user_address varchar(30) not null,
    com_id varchar(10),
    all_report int not null default 0,
    done_report int not null default 0,
    undone_report int not null default 0,
    primary key(user_id),
    foreign key(com_id) references com_info(com_id)

);

create table admin_info(
    admin_id varchar(10) not null,
    admin_pwd varchar(20) not null,
    admin_name varchar(8) not null,
    admin_sex enum('男','女'),
    admin_phone varchar(11) not null,
    admin_email varchar(20) not null,
    all_report int not null default 0,
    done_report int not null default 0,
    undone_report int not null default 0,
    primary key(admin_id)
);

create table repairman_info(
    repairman_id varchar(10) not null,
    repairman_pwd varchar(20) not null,
    repairman_name varchar(8) not null,
    repairman_sex enum('男','女'),
    repairman_phone varchar(11) not null,
    repairman_email varchar(20) not null,
    all_report int not null default 0,
    done_report int not null default 0,
    undone_report int not null default 0,
    primary key(repairman_id)
);

create table report_form(
    report_id varchar(10) not null,
    report_title varchar(10) not null,
    report_datetime datetime not null,
    report_reason varchar(255) not null,
    user_id varchar(10) not null,
    com_id varchar(10) not null,
    admin_id varchar(10) not null,
    report_admin_check enum('0','1') default '0',
    repairman_id varchar(10) not null,
    report_repairman_check enum('0','1') default '0',
    report_status enum('审核中','审核完成,维修中','维修完成') default '审核中',
    primary key(report_id),
    foreign  key(admin_id) references admin_info(admin_id),
    foreign key(repairman_id)  references repairman_info(repairman_id)
);

-- insert data

-- insert com_info

insert into com_info values
('X441UVK','联想',5699,'黑色'),
('X444GHJ','外星人',13699,'黑色'),
('X223TYU','戴尔',5499,'黑色'),
('X662ERT','清华东方',3499,'黑色'),
('X870XCV','华硕',5299,'黑色'),
('X231RTY','三星',13699,'黑色'),
('X650GFD','索尼',6699,'黑色'),
('X980LKJ','机械师',6199,'白色'),
('X675BVJ','惠普',6199,'白色'),
('X672HGY','玩家国度',10999,'黑色'),
('X447YHX','苹果',7999,'黑色'),
('X340YTU','华为',5999,'白色'),
('X548IKB','小米',4899,'黑色'),
('X430UYT','微软',13000,'白色'),
('X651POL','LG',6899,'白色'),
('X560UJA','海尔',3399,'黑色'),
('X430KJZ','弘基',4099,'白色'),
('X901HYX','东芝',1099,'黑色'),
('X230ZXR','方正',3299,'白色'),
('X564JHU','雷神','3788','黑色');

-- insert user_info

insert into user_info
(user_id,user_name,user_sex,user_phone,user_email,user_address,com_id)
values
('182017628','余剑威','男','13837849201','167389097@qq.com','东35-101','X441UVK'),
('182017535','郭彦君','女','16489503895','184939385@qq.com','东35-245','X444GHJ'),
('172017526','张展锋','男','13538846525','185634983@qq.com','东35-235','X223TYU'),
('182017444','刘洋歌','男','16495658965','462539456@qq.com','东35-626','X430UYT'),
('182017327','于海祎','女','13569456896','423649536@qq.com','西6-205','X340YTU'),
('182017222','陈天赐','男','13646259564','995057277@qq.com','东31-311','X548IKB'),
('182017423','黄晓','男','13828646333','856426595@qq.com','东21-322','X430KJZ'),
('182017785','杨幂可','女','15648623344','898985623@qq.com','西7-452','X651POL'),
('182017352','郭卫东','男','15646364635','533236451@qq.com','东21-321','X870XCV'),
('182017666','王志芳','女','15556234625','265635254@qq.com','东35-231','X430UYT'),
('182017852','贾隽仙','男','18218364625','152323654@qq.com','东35-451','X560UJA'),
('182017465','刘振杰','男','12366356456','152463564@qq.com','东35-851','X441UVK'),
('182017456','韩云庆','男','15233462556','895625354@qq.com','东35-421','X564JHU'),
('182017652','王安琪','女','13566545655','895623523@qq.com','东35-811','X430UYT'),
('182017632','李珊珊','女','13598989656','452356552@qq.com','东35-823','X675BVJ'),
('182017868','戴欣瑞','女','15645235645','785263123@qq.com','东35-523','X650GFD'),
('182017651','王全胜','男','18248656562','885659535@qq.com','东35-253','X340YTU'),
('182017335','李现','男','13156452653','995623542@qq.com','东35-612','X430KJZ'),
('182017745','蔡心恒','女','13656857454','785364245@qq.com','东35-633','X901HYX'),
('182017258','王静','女','13189464524','778596589@qq.com','东35-252','X223TYU');


-- insert admin_info
insert into admin_info
(admin_id,admin_pwd,admin_name,admin_sex,admin_phone,admin_email)
values 
('164924','1478963','许东山','男','13623456778','qwe@163.com'),
('182495','1236987','何白露','女','13178978999','heyy@sina.com'),
('103871','7410258','姜明','男','13599647853','jm@163.com'),
('190357','8520369','丁峻帆','男','18345996673','jfd@126.com'),
('197398','7419632','汪迪','女','14966317541','eve@163.com'),
('100158','4263344','蒋吉利','女','19677483286','ntw@163.com'),
('189460','1796249','董雪琳','女','18644935791','msi@163.com'),
('173945','8649734','周姜琦','女','17699483217','few@163.com'),
('196473','8647319','黄雅雯','女','13163787996','ywh@163.com'),
('173486','4761985','翁伊暖','女','13560555486','wyn@163.com'),
('182496','8444637','徐家启','男','16977458426','sgr@163.com'),
('196776','3792963','王一民','男','14683217056','mhs@163.com'),
('163746','1561847','唐林','男','13347620017','mht@163.com'),
('129347','4039710','陈凯力','男','13749601752','jyr@163.com'),
('167105','3971284','赵子冉','男','13974682564','vyh@163.com'),
('193720','9213879','贾利卡','男','13657940182','mdi@163.com'),
('193486','2792147','丁俊凡','男','18314984059','nrw@163.com'),
('196478','4792769','孔丽奇','女','13400687410','muw@163.com'),
('194823','2485136','夏莉怡','女','18047862687','nxp@163.com'),
('195720','2547922','邓长海','男','13942083008','mxy@163.com');

-- insert repairman_info
insert into repairman_info
(repairman_id,repairman_pwd,repairman_name,repairman_sex,repairman_phone,repairman_email)
values
('197094866','Wsa123456','王申安','男','13922256385','cynthia_017@163.com'),
('150939468','Zzh888888','周焯豪','男','13922265291','150939468@qq.com'),
('130922387','q84776024','岳烈阳','男','13926656387','miikii2008@gmail.com'),
('137568711','Qq478486','温壮祥','男','13775711568','syvia_lili@163.com'),
('113654879','Zhang4848','余玉玲','女','15982869840','313654879@qq.com'),
('103609793','Licaiye123','李彩夜','男','13559767998','503609793@qq.com'),
('137898788','Luquanxun666','卢全勋','男','13608844605','mijobs@126.com'),
('135363952','Wcw49494','王成文','男','13560988741','735363952@qq.com'),
('168968384','Zhangyue1122','张月成','男','13788779775','568968384@qq.com'),
('115028320','4970144788','张玲刚','男','15999871614','1150283200@qq.com'),
('106200379','Lgb123645','凌谷薄','男','13791067454','306200379@qq.com'),
('128962756','Lyllyllyl123','林悦来','男','15789888644','28962756@qq.com'),
('154616595','Yuduchi666','于杜池','男','13588995456','1150590729@qq.com'),
('145461659','Heyinb987','何毅','男','13248973154','454616595@qq.com'),
('115101826','qwerqwer','莫丽恩','男','15987012454','1151018265@qq.com'),
('159688306','Zxcszxcv123','魏元琦','男','13556406997','659688306@qq.com'),
('199122370','Zhangshunyu666','张顺宇','男','13784455605','991223706@qq.com'),
('178941154','Zhs4970948','张淮深','男','15920835741','mikerun@126.com'),
('137118861','Wtengzhen123','王腾镇','男','13711886771','mikelaoma@163.com'),
('158386803','Wangyusi9874','王雨思','女','13557971546','583868031@qq.com');

-- create view

create view check_user_info as select user_info.*, com_info.com_name from user_info inner join com_info on user_info.com_id = com_info.com_id;

-- create procedure

-- >>>>>>>>>>>>>>>>>>用户<<<<<<<<<<<<<<<<<

delimiter $
create procedure check_user_info(in c_user_name varchar(8))
begin
    select user_info.*, com_info.com_name from user_info inner join com_info on user_info.com_id = com_info.com_id where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure edit_user_name(in d_user_name varchar(8), in c_user_name varchar(8))
begin
    update user_info set user_name = c_user_name where user_name = d_user_name;
end$
delimiter ;

delimiter $
create procedure edit_user_sex(in c_user_name varchar(8), in sex varchar(4))
begin
    update user_info set user_sex = sex where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure edit_com_id(in c_user_name varchar(8), in d_com_id varchar(10))
begin
    update user_info set com_id = d_com_id where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure edit_user_phone(in c_user_name varchar(8), in c_user_phone varchar(11))
begin
    update user_info set user_phone = c_user_phone where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure edit_user_email(in c_user_name varchar(8), in c_user_email varchar(20))
begin
    update user_info set user_email = c_user_email where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure edit_user_address(in c_user_name varchar(8), in c_user_address varchar(30))
begin
    update user_info set user_address = c_user_address where user_name = c_user_name;
end$
delimiter ;

delimiter $
create procedure update_report(in c_user_name varchar(8),in c_report_title varchar(10), in c_report_reason varchar(255))
begin
    declare c_report_id varchar(10);
    declare c_com_id varchar(10);
    declare c_user_id varchar(10);
    declare c_admin_id varchar(10);
    declare c_repairman_id varchar(10);
    select concat(year(curdate()),month(curdate()),day(curdate()),floor(rand()* 101)) into c_report_id;
    select user_id into c_user_id from user_info where user_name = c_user_name;
    select com_id into c_com_id from user_info where user_name = c_user_name;
    select admin_id into c_admin_id from admin_info order by rand() limit 1;
    select repairman_id into c_repairman_id from repairman_info order by rand() limit 1;
    insert into report_form (report_id,report_title,report_datetime,report_reason,user_id,com_id,admin_id,repairman_id)
    values
    (c_report_id,c_report_title,curdate(),c_report_reason,c_user_id,c_com_id,c_admin_id,c_repairman_id); 
end$
delimiter ;

delimiter $
create procedure delete_report(in c_user_name varchar(8), in c_report_id varchar(10))
begin
    declare c_user_id varchar(10);
    declare whether char;
    set @error = 'report_admin_check is 1';
    select user_id into c_user_id from user_info where user_name = c_user_name;
    select report_admin_check into whether from report_form where report_id = c_report_id;
    if whether = '0' then
        delete from report_form where user_id = c_user_id and report_id = c_report_id;
    else
        select @error;
    end if;
end$
delimiter ;

delimiter $
create procedure check_report_us(in c_user_name varchar(8), in c_report_status char(10))
begin
    declare c_user_id varchar(10);
    select user_id into c_user_id from user_info where user_name = c_user_name;
    if c_report_status = 'null' then
        select * from report_form where user_id = c_user_id;
    else 
        select * from report_form where user_id = c_user_id and report_status = c_report_status;
    end if;
end$
delimiter ;

-- =================================================

-- >>>>>>>>>>>>>>>>>>>>>>>审核员<<<<<<<<<<<<<<<<<<<<<<<<<

delimiter $
create procedure check_user_ad(in c_user_name varchar(8),in c_admin_id varchar(10),in c_admin_pwd varchar(20))
begin
    declare whether_admin_pwd varchar(20);
    set @error = "cant't check user_info";
    select admin_pwd into whether_admin_pwd from admin_info where admin_id = c_admin_id;
    if c_admin_pwd = whether_admin_pwd then
        if c_user_name = 'null' then
            select user_info.*, com_info.com_name from user_info inner join com_info on user_info.com_id = com_info.com_id;
        else
            select user_info.*, com_info.com_name from user_info inner join com_info on user_info.com_id = com_info.com_id where user_name = c_user_name;
        end if;
    else
        select @error;
    end if;
end$

delimiter ;

delimiter $
create procedure check_admin_ad(in c_admin_name varchar(8),in c_admin_id varchar(10), in c_admin_pwd varchar(20))
begin
    declare whether_admin_pwd varchar(20);
    set @error = "can't check admin_info";
    select admin_pwd into whether_admin_pwd from admin_info where admin_id = c_admin_id;
    if c_admin_pwd = whether_admin_pwd then
        if c_admin_name = 'null' then
            select * from admin_info;
        else
            select * from admin_info where admin_name = c_admin_name;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

delimiter $
create procedure check_repairman_ad(in c_repairman_name varchar(8),in c_admin_id varchar(10), in c_admin_pwd varchar(20))
begin
    declare whether_admin_pwd varchar(20);
    set @error = "can't check repairman_info";
    select admin_pwd into whether_admin_pwd from admin_info where admin_id = c_admin_id;
    if c_admin_pwd = whether_admin_pwd then
        if c_repairman_name = 'null' then
            select * from repairman_info;
        else
            select * from repairman_info where repairman_name = c_repairman_name;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

delimiter $
create procedure check_report_ad(in c_admin_id varchar(10), in c_admin_pwd varchar(20) ,in c_report_status varchar(10))
begin
    declare whether_admin_pwd varchar(20);
    set @error = "can't check report_form";
    select admin_pwd into whether_admin_pwd from admin_info where admin_id = c_admin_id;
    if c_admin_pwd = whether_admin_pwd then
        if c_report_status = 'null' then
            select * from report_form where admin_id = c_admin_id;
        else
            select * from report_form where admin_id = c_admin_id and report_status = c_report_status;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

delimiter $
create procedure edit_report_ad(in c_admin_id varchar(10), in c_admin_pwd varchar(20), in c_report_id varchar(10), in c_report_admin_check char(6))
begin
    declare whether_admin_pwd varchar(20);
    set @error = "can't change report_form";
    select admin_pwd into whether_admin_pwd from admin_info where admin_id = c_admin_id;
    if c_admin_pwd = whether_admin_pwd then
        if c_report_admin_check = '1' then
            update report_form set report_admin_check = c_report_admin_check, report_status = '审核完成,维修中';
        else
            update report_form set report_admin_check = c_report_admin_check, report_status = '审核中';
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

-- =========================================================

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>维修员<<<<<<<<<<<<<<<<<<<<<<<<<<

delimiter $
create procedure check_repairman_re(in c_repairman_name varchar(8),in c_repairman_id varchar(10), in c_repairman_pwd varchar(20))
begin
    declare whether_repairman_pwd varchar(20);
    set @error = "can't check repairman_info";
    select repairman_pwd into whether_repairman_pwd from repairman_info where repairman_id = c_repairman_id;
    if c_repairman_pwd = whether_repairman_pwd then
        if c_repairman_name = 'null' then
            select * from repairman_info;
        else
            select * from repairman_info where repairman_name = c_repairman_name;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;



delimiter $
create procedure check_admin_re(in c_admin_name varchar(8),in c_repairman_id varchar(10), in c_repairman_pwd varchar(20))
begin
    declare whether_repairman_pwd varchar(20);
    set @error = "can't check admin_info";
    select repairman_pwd into whether_repairman_pwd from repairman_info where repairman_id = c_repairman_id;
    if c_repairman_pwd = whether_repairman_pwd then
        if c_admin_name = 'null' then
            select * from admin_info;
        else
            select * from admin_info where admin_name = c_admin_name;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

delimiter $
create procedure check_report_re(in c_repairman_id varchar(10), in c_repairman_pwd varchar(20) ,in c_report_status varchar(10))
begin
    declare whether_repairman_pwd varchar(20);
    set @error = "can't check report_form";
    select repairman_pwd into whether_repairman_pwd from repairman_info where repairman_id = c_repairman_id;
    if c_repairman_pwd = whether_repairman_pwd then
        if c_report_status = 'null' then
            select * from report_form where repairman_id = c_repairman_id and report_admin_check = '1';
        else
            select * from report_form where repairman_id = c_repairman_id and (report_status = c_report_status and report_admin_check = '1');
        end if;
    else
        select @error;
    end if;
end$
delimiter ;



delimiter $
create procedure edit_report_re(in c_repairman_id varchar(10), in c_repairman_pwd varchar(20), in c_report_id varchar(10), in c_report_repairman_check char(6))
begin
    declare whether_repairman_pwd varchar(20);
    declare c_report_admin_check char(2);
    set @error = "can't change report_form";
    select repairman_pwd into whether_repairman_pwd from repairman_info where repairman_id = c_repairman_id;
    select report_admin_check into c_report_admin_check from report_form where  report_id = c_report_id;
    if c_repairman_pwd = whether_repairman_pwd then
        if c_report_admin_check = '1' then
            if c_report_repairman_check = '1' then
                update report_form set report_repairman_check = c_report_repairman_check, report_status = '维修完成';
            else
                update report_form set report_admin_check = c_report_admin_check, report_status = '审核完成,维修中';
            end if;
        else
            set @error = "report_admin_check is 1";
            select @error;
        end if;
    else
        select @error;
    end if;
end$
delimiter ;

-- =============================================

-- create trigger

-- >>>>>>>>>>>>>>>>>>>用户<<<<<<<<<<<<<<<<<<<<<<<

delimiter $
create trigger add_report after insert
on report_form for each row
begin
    update user_info set all_report = all_report + 1, undone_report = undone_report + 1 where user_id =  new.user_id;
    update admin_info set all_report = all_report + 1, undone_report  = undone_report + 1 where admin_id = new.admin_id;
end$
delimiter ;

delimiter $
create trigger delete_report after delete
on report_form for each row
begin
    update user_info set all_report = all_report - 1, undone_report = undone_report - 1 where user_id =  old.user_id;
    update admin_info set all_report = all_report - 1, undone_report  = undone_report - 1 where admin_id = old.admin_id;
end$
delimiter ;

-- >>>>>>>>>>>>>>>>>>>审核员 and 维修员<<<<<<<<<<<<<<<<<<<<<<

delimiter $
create trigger update_report after update
on report_form for each row
begin
    if new.report_admin_check = '1' and new.report_repairman_check = '0' then
        update admin_info set done_report = done_report + 1, undone_report = undone_report - 1 where admin_id = new.admin_id;
        update repairman_info set all_report = all_report + 1, undone_report = undone_report + 1 where repairman_id = new.repairman_id;
    elseif new.report_admin_check = '1' and new.report_repairman_check = '1' then
        update repairman_info set undone_report = undone_report - 1, done_report = done_report + 1 where repairman_id = new.repairman_id;
        update user_info set undone_report = undone_report - 1, done_report = done_report + 1 where user_id = new.user_id;
    end if;
end$
delimiter ;