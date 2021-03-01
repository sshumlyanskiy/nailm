create table client (id int8 generated by default as identity, firstname varchar(255), patronymic varchar(255), phone varchar(255), surname varchar(255), company_id int8, primary key (id));
create table client_records (client_id int8 not null, records_id int8 not null);
create table company (id int8 generated by default as identity, name varchar(255), primary key (id));
create table company_clients (company_id int8 not null, clients_id int8 not null);
create table company_employees (company_id int8 not null, employees_id int8 not null);
create table employee (id int8 generated by default as identity, primary key (id));
create table employee_companies (employee_id int8 not null, companies_id int8 not null);
create table procedure_type (id int8 generated by default as identity, duration int8, name varchar(255), primary key (id));
create table record (id int8 generated by default as identity, finish_time timestamp, start_time timestamp, client_id int8, primary key (id));
create table record_procedure_types (record_id int8 not null, procedure_types_id int8 not null);
alter table if exists client_records add constraint UK_ghc3prn7gvwonyfa97r066vrx unique (records_id);
alter table if exists company_clients add constraint UK_std5yh2ya3deohtc98v6ljfbk unique (clients_id);
alter table if exists client add constraint FKbdkhriogfnems0qpgiasmf3x8 foreign key (company_id) references company;
alter table if exists client_records add constraint FKlntibwsdb8wfsjyjfl29hbx2e foreign key (records_id) references record;
alter table if exists client_records add constraint FKhyeot7m8h3nrwt1tikw2yuk4m foreign key (client_id) references client;
alter table if exists company_clients add constraint FKijb6nstc15vjrm1v9h060ip9l foreign key (clients_id) references client;
alter table if exists company_clients add constraint FKn69hq7siqu37t9x2gvdmq62us foreign key (company_id) references company;
alter table if exists company_employees add constraint FKnntnqhhla66c4h9ddbnlvqk2x foreign key (employees_id) references employee;
alter table if exists company_employees add constraint FKd66w6jx84tydyd8sf9mpqh5je foreign key (company_id) references company;
alter table if exists employee_companies add constraint FK8jam9lpsb048kdc5ujbj2gxjs foreign key (companies_id) references company;
alter table if exists employee_companies add constraint FKt7jkf8ye0d0pt5ppnsvg18rv1 foreign key (employee_id) references employee;
alter table if exists record add constraint FKii82e8vwfjf606lsybnio7i19 foreign key (client_id) references client;
alter table if exists record_procedure_types add constraint FKdpwxbecrdvrs0yc02mm4hcvwl foreign key (procedure_types_id) references procedure_type;
alter table if exists record_procedure_types add constraint FKdbg3gb55qvgsndj89gu4voawu foreign key (record_id) references record;
