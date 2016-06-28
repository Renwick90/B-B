DROP TABLE rooms;

CREATE TABLE rooms(
  id serial4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  nights INT4 not null,
  breakfast VARCHAR(255),
  type_of_room VARCHAR(255)
);