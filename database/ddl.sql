DROP DATABASE IF EXISTS matchdiary;
CREATE DATABASE matchdiary;
USE matchdiary;

CREATE TABLE team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    photo_url VARCHAR(1024) NOT NULL,
    CHECK (
        state IN (
            'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA',
            'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN',
            'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
        )
    ),
    UNIQUE (name, state)
);

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL,

    team_one INT NOT NULL,
    score_team_one INT NOT NULL,

    team_two INT NOT NULL,
    score_team_two INT NOT NULL,

    team_supported INT NOT NULL,

    UNIQUE (date, team_one, team_two),

    FOREIGN KEY (team_one) REFERENCES team(id)
        ON UPDATE CASCADE ON DELETE NO ACTION,

    FOREIGN KEY (team_two) REFERENCES team(id)
        ON UPDATE CASCADE ON DELETE NO ACTION,

    FOREIGN KEY (team_supported) REFERENCES team(id)
        ON UPDATE CASCADE ON DELETE NO ACTION
);
