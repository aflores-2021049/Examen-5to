DROP DATABASE IF EXISTS db_control_materia_in5bm;
CREATE DATABASE IF NOT EXISTS db_control_materia_in5bm
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE db_control_materia_in5bm;

DROP TABLE IF EXISTS materia;

CREATE TABLE IF NOT EXISTS materia(
	id_materia INT NOT NULL AUTO_INCREMENT,
    nombre_materia VARCHAR(45) NOT NULL,
    ciclo_escolar YEAR NULL,
    horario_inicio TIME NULL,
    horario_final TIME NULL,
	catedratico VARCHAR(45) NOT NULL,
    salon VARCHAR(45) NOT NULL,
    cupo_maximo INT NULL,
    cupo_minimo INT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (id_materia)
);


#------------------------------------- Materia -------------------------------------#

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_materia_create $$
CREATE PROCEDURE sp_materia_create(
	IN _nombre_materia VARCHAR(45),
    IN _ciclo_escolar YEAR,
    IN _horario_inicio TIME,
    IN _horario_final TIME,
	IN _catedratico VARCHAR(45),
    IN _salon VARCHAR(45),
    IN _cupo_maximo INT,
    IN _cupo_minimo INT,
    IN _nota INT
)
BEGIN
	INSERT INTO materia(
		nombre_materia,
        ciclo_escolar,
        horario_inicio,
        horario_final,
        catedratico,
        salon,
        cupo_maximo,
        cupo_minimo,
        nota
    )
    VALUES
    (
		_nombre_materia,
        _ciclo_escolar,
        _horario_inicio,
        _horario_final,
        _catedratico,
        _salon,
        _cupo_maximo,
        _cupo_minimo,
        _nota
    );
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_materia_read $$
CREATE PROCEDURE sp_materia_read()
BEGIN
	SELECT
		m.id_materia,
        m.nombre_materia,
        m.ciclo_escolar,
        m.horario_inicio,
        m.horario_final,
        m.catedratico,
        m.salon,
        m.cupo_maximo,
        m.cupo_minimo,
        m.nota
	FROM
		materia AS m;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_materia_read_by_id $$
CREATE PROCEDURE sp_materia_read_by_id(
	IN _id_materia INT
)
BEGIN
	SELECT
		m.id_materia,
        m.nombre_materia,
        m.ciclo_escolar,
        m.horario_inicio,
        m.horario_final,
        m.catedratico,
        m.salon,
        m.cupo_maximo,
        m.cupo_minimo,
        m.nota
	FROM
		materia AS m
	WHERE
		m.id_materia = _id_materia;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_materia_update $$
CREATE PROCEDURE sp_materia_update(
	IN _id_materia INT,
	IN _nombre_materia VARCHAR(45),
    IN _ciclo_escolar YEAR,
    IN _horario_inicio TIME,
    IN _horario_final TIME,
	IN _catedratico VARCHAR(45),
    IN _salon VARCHAR(45),
    IN _cupo_maximo INT,
    IN _cupo_minimo INT,
    IN _nota INT
)
BEGIN
	UPDATE
		materia AS m
	SET
		m.nombre_materia = _nombre_materia,
        m.ciclo_escolar = _ciclo_escolar,
        m.horario_inicio =_horario_inicio,
        m.horario_final =_horario_final,
        m.catedratico = _catedratico,
        m.salon =_salon,
        m.cupo_maximo =_cupo_maximo,
        m.cupo_minimo =_cupo_minimo,
        m.nota = _nota
	WHERE
		m.id_materia = _id_materia;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_materia_delete $$
CREATE PROCEDURE sp_materia_delete(
	IN _id_materia INT
)
BEGIN
	DELETE FROM
		materia AS m
	WHERE
		m.id_materia = _id_materia;
END$$
DELIMITER ;


#---------------------------------------------------------------------------------------------------#
call sp_materia_create("Lengua", '2020', '07:00:00', '8:00:00', "Pedro Armas", "A001", 200 , 1, 70);
call sp_materia_create("Filosofía", '2021', '8:00:00', '9:00:00', "Luis Fonsi", "A005", 100, 1, 70);
call sp_materia_create("Anatomía", '2022', '9:00:00', '10:00:00', "Lionel Messi", "A010", 110, 1, 70);
call sp_materia_create("Fisiología", '2020', '10:00:00', '11:00:00', "Alex Canto", "A015", 115, 1, 60);
call sp_materia_create("Arquitectura", '2021', '7:00:00', '7:30:00', "Jaime Muralles", "A020", 170, 2, 65);
call sp_materia_create("Ingeniería", '2022', '7:30:00', '8:00:00', "Pablo Escobar", "A025", 150, 4, 65);
call sp_materia_create("Química", '2020', '8:00:00', '8:30:00', "Marco Gomes", "A030", 130, 15, 70);
call sp_materia_create("Danza", '2021', '8:30:00', '9:00:00', "Marvin Larios", "A035", 145, 10, 70);
call sp_materia_create("Taller", '2022', '9:00:00', '10:30:00', "Cris Cruz", "A040", 135, 35, 60);
call sp_materia_create("Sociales", '2020', '10:30:00', '12:00:00', "Samuel Pedrera", "A045", 100, 30, 60);