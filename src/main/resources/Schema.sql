
-- CREATE DataBase

drop database if exists bigDataSolutions;

create database bigDataSolutions;

use bigDataSolutions;

-- CREATE Tables

CREATE TABLE `type` (
`TYPE` varchar(45) NOT NULL DEFAULT '',
`DESCRIPTION` varchar(150) NOT NULL DEFAULT '',
PRIMARY KEY (`TYPE`)
);


CREATE TABLE `type_value` (
`TYPE` varchar(45) NOT NULL DEFAULT '',
`TYPE_VALUE` varchar(100) DEFAULT '',
`DESCRIPTION` varchar(100) DEFAULT '',
`TYPE_ATTRIBUTE` varchar(45) NOT NULL DEFAULT '',
`ALT_VALUE_1` varchar(100) DEFAULT NULL,
`ALT_VALUE_2` varchar(100) DEFAULT NULL,
`ALT_VALUE_3` varchar(100) DEFAULT NULL,

PRIMARY KEY (`TYPE`,`TYPE_ATTRIBUTE`),
CONSTRAINT `FK_type_value_1` FOREIGN KEY (`TYPE`) REFERENCES `type` (`TYPE`) ON DELETE CASCADE ON UPDATE CASCADE
);


-- FILL Tables (for test)

INSERT INTO `type` (`TYPE` , `DESCRIPTION`)
VALUES ('A', 'first_letter'),
       ('B', 'second_letter'),
       ('C', 'third_letter');


INSERT INTO `type_value` (`TYPE` , `TYPE_VALUE`,  `DESCRIPTION`, `TYPE_ATTRIBUTE`)
VALUES ('A', 'alphabet_letter_A', 'first_letter', 'attribute_of_A_letter'),
       ('B', 'alphabet_letter_B', 'second_etter', 'attribute_of_B_letter'),
       ('C', 'alphabet_letter_C', 'third_letter', 'attribute_of_C_letter');













