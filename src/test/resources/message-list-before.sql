delete from message;

insert into message(id, text, tag, user_id) values
(1, 'first','tag',1),
(2, 'second','anotherTag',1),
(3, 'third','tag',2),
(4, 'fourth','more',1);
delete from hibernate_sequence;

insert into hibernate_sequence(next_val) values (2), (10);