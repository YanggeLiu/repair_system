# **电脑报修系统**

## **表结构**

### **用户信息表**

- user_id varchar(10) not null (用户id) <font color=yellow>**(主键)**</font>

- user_name varchar(20) not null (用户姓名)

- user_sex enum('男','女') (用户性别)

- user_phone varchar(11) not null (用户联系号码)

- user_email varchar(20) not null (用户邮箱)

- user_address varchar(30) not null (用户地址)

- com_id varchar(10) not null (电脑型号id) <font color=yellow>**(外键)**</font>

- all_report int not null default 0 (全部订单数)

- done_report int not null default 0 (已完成订单数)

- undone_report int not null default 0 (未完成订单数)


### **电脑型号信息表**

- com_id varchar(10) not null (电脑型号id) <font color=yellow>**(主键)**</font>

- com_name varchar(20) not null (电脑型号名称)

- com_price float not null (电脑型号价格)

- com_color varchar(10) not null (电脑型号颜色)

### **审核员信息表**

- admin_id varchar(10) not null (审核员id) <font color=yellow>**(主键)**</font>

- admin_pwd varchar(20) not null (审核员密码)

- admin_name varchar(8) not null (审核员姓名)

- admin_sex enum('男', '女') (审核员性别)

- admin_phone varchar(11) not null (审核员联系号码)

- admin_email varchar(20) not null (审核员邮箱)

- all_report int not null default 0 (全部审核数量)

- done_report int not null default 0 (已完成审核数)

- undone_report int not null default 0 (待审核数量数)

### **维修员信息表**

- repairman_id varchar(10) not null (维修员id) <font color=yellow>**(主键)**</font>

- repairman_pwd varchar(20) not null (维修员密码)

- repairman_name varchar(8) not null (维修员姓名)

- repairman_sex enum('男','女') (维修员性别)

- repairman_phone varchar(11) not null (维修员联系号码)

- repairman_email varchar(20) not null (维修员邮箱)

- all_report int not null default 0 (全部维修数量)

- done_report int not null default 0 (已完成维修数)

- undone_report int not null default 0 (待维修数)

### **报修单信息表**

- report_id varchar(10) not null (报修单号) <font color=yellow>**(主键)**</font>

- report_title varchar(10) not null (报修标题)

- report_date datetime not null (报修时间)

- report_reason varchar(255) not null (报修原因)

- user_id varchar(10) not noll (用户id) <font color=yellow>**(外键)**</font>

- com_id varchar(10) not null (电脑型号id) <font color=yellow>**(外键)**</font>

- admin_id varchar(10) (审核员id) <font color=yellow>**(外键)**</font>

- report_admin_check enum('0','1') default '0' (审核状态)

- repairman_id varchar(10) (维修员id) <font color=yellow>**(外键)**</font>

- report_repairman_check enum('0','1') default '0' (维修状态)

- report_status enum('审核中','审核完成,维修中','维修完成') default '审核中' (保修单状态)


## **视图**

## **(复制usage时,勿将 ';'一同复制,填写数据后自行添加运行)**


- check_user_info (查看所有用户信息及其用户的电脑详细信息)

- usage
```
select * from check_user_info;
```


## **存储过程**

### **用户**

- check_user_info() (查询用户详细信息)
- usage
```
call check_user_info('user_name');
```

- edit_user_name() (修改用户姓名)
- usage
```
call edit_user_name('old_user_name','new_user_name');
```

- edit_user_sex() (修改用户性别)
- usage
```
call edit_user_sex('user_name','sex');
```

- edit_com_id() (修改用户电脑型号id)
- usage
```
call edit_com_id('user_name','com_id');
```

- edit_user_phone() (修改用户联系号码)
- usage
```
call edit_user_phone('user_name','user_phone');
```

- edit_user_email() (修改用户用户邮箱)
- usage
```
call edit_user_email('user_name','user_email');
```

- edit_user_address() (修改用户地址)
- usage
```
call edit_user_address('user_name','user_address');
```

- update_report() (填写报修单)
- usage
```
call update_report('user_name','report_title','report_reason');
```

- delete_report() (删除报修单)
- usage
```
call delete_report('user_name','report_id');
```

- check_report_us() (按条件查询保修单)
- usage
```
call check_report_us('use_name','report_status');
```

### **审核员**

- check_user_ad() (查询指定用户信息)
- usage
```
call check_user_ad('user_name','admin_id','admin_pwd');
```

- check_admin_ad() (查询指定审核员信息)
- usage
```
call check_admin_ad('admin_name','admin_id','admin_pwd');
```

- check_repairman_ad() (查询指定维修员信息)
- usage
```
call check_repairman_ad('repairman_name','admin_id','admin_pwd');
```

- check_report_ad() (查询指定报修单)
- usage
```
call check_report_ad('admin_id','admin_pwd','report_status');
```

- edit_report_ad() (修改指定报修单状态)
- usage
```
call edit_report_ad('admin_id','admin_pwd','report_id','report_admin_check');
```


#### **维修员**

- check_repairman_re() (查询指定维修员 null为查询全部员工)
- usage
```
call check_repairman_re('repairman_name','repairman_id','repairman_pwd');
```

- check_admin_re() (查询指定审核员工 null为查询全部员工)
- usage
```
call check_admin_re('admin_name','repairman_id','repairman_pwd');
```

- check_report_re() (保修单详细信息,仅针对已审核通过单号)
- usage
```
call check_report_re('repairman_id','repairman_pwd','report_status');
```

- edit_report_re() (修改指定报修单状态)
- usage
```
call edit_report_re('repairman_id','repairman_pwd','report_id','report_repairman_check');
```

## **触发器**

### **用户**

- add_report (用户填写新报修单, 用户全部报修单+ 用户未完成报修单+ 审核员全部订单+ 审核员待审核订单+ )

- delete_report (用户删除报修单, 用户全部报修单- 用户未完成报修单- 审核员全部订单- 审核员待审核报修单-)

### **审核员**

- check_report_ad (审核员审核新报修单, 审核员已审核报修单+ 审核员待审核报修单- 维修员全部报修单+ 维修员未完成报修单+ )

### **维修员**

- check_reporrt_re (维修员审核新报修单, 维修员已维修订单+ 维修员待维修报修单- 用户已完成报修单+ 用户未完成报修单-)

## **权限管理(无需运行,仅供报告参考)**

### **创建用户登录账号和密码**
- usage
```
create user 'YanggeLiu'@'localhost' indentified by '182017444';
```

### **授予用户数据库操作权限**
- usage
```
grant all on repair_system.* to 'YanggeLiu'@'localhost' with grant option;
```


## **数据库备份与恢复(无需运行,仅供报告参考)**

### **数据库备份**
- usage
```
mysql -u root -h localhost -p repair_system > ~/repair_system_backup.sql
```

### **数据库恢复**
- usage
```
mysql -u root -h localhost -p repair_system < ~/repair_system_backup.sql
```

