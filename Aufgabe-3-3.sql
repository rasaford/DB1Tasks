create table mp3music (
  Titel varchar(50) primary key,
  Interpret varchar(50) not null,
  dauer varchar(5) not null,
  groesse numeric(11) not null,
  dateiname varchar(30) not null,
  download date

);

insert into mp3music (titel, interpret, dauer, groesse, dateiname, download) values ('Yesterday', 'Beatles', '3:21', 1563, 'B001.mp3', to_date('31.10.12', 'DD.MM.YYYY'));
insert into mp3music (titel, interpret, dauer, groesse, dateiname) values ('Road Trippin', 'Beatles', '4:17', 1863, 'R189.mp3');
insert into mp3music (titel, interpret, dauer, groesse, dateiname, download) values ('Biko', 'Peter Gabriel', '5:37', 2159, 'G023.mp3', to_date('23.10.11', 'DD.MM.YYYY'));

commit;

select * from mp3music;
select sum(groesse) from mp3music;
delete from mp3music where interpret like ('%DJÖtzi%');

create index imp3music1 on mp3music(dateiname);

alter table mp3music add (
  edatum date,
  kosten numeric(6,2)
);
alter table modify (
  groesse null
);

update mp3music set groesse = null;
