-- Apaga o banco se existir
DROP DATABASE IF EXISTS matchdiary;

-- Cria o banco
CREATE DATABASE matchdiary
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Usa o banco
USE matchdiary;

-- =========================
-- TABELA: team
-- =========================
CREATE TABLE team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    photo_url VARCHAR(1024) NOT NULL,

    CONSTRAINT chk_state CHECK (
        state IN (
            'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA',
            'MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN',
            'RS','RO','RR','SC','SP','SE','TO'
        )
    ),

    CONSTRAINT uq_team UNIQUE (name, state)
) ENGINE=InnoDB;

-- =========================
-- TABELA: matches
-- =========================
CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,

    team_one_id INT NOT NULL,
    score_team_one INT NOT NULL CHECK (score_team_one >= 0),

    team_two_id INT NOT NULL,
    score_team_two INT NOT NULL CHECK (score_team_two >= 0),

    team_supported_id INT NOT NULL,

    CONSTRAINT uq_match UNIQUE (date, team_one_id, team_two_id),

    CONSTRAINT fk_team_one
        FOREIGN KEY (team_one_id)
        REFERENCES team(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_team_two
        FOREIGN KEY (team_two_id)
        REFERENCES team(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_team_supported
        FOREIGN KEY (team_supported_id)
        REFERENCES team(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;
