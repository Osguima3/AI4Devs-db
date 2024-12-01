CREATE TABLE Candidate (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(100)
);

CREATE TABLE Education (
    id SERIAL PRIMARY KEY,
    institution VARCHAR(100) NOT NULL,
    title VARCHAR(250) NOT NULL,
    startDate TIMESTAMP NOT NULL,
    endDate TIMESTAMP,
    candidateId INT NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES Candidate(id)
);

CREATE TABLE WorkExperience (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    startDate TIMESTAMP NOT NULL,
    endDate TIMESTAMP,
    candidateId INT NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES Candidate(id)
);

CREATE TABLE Resume (
    id SERIAL PRIMARY KEY,
    filePath VARCHAR(500) NOT NULL,
    fileType VARCHAR(50) NOT NULL,
    uploadDate TIMESTAMP NOT NULL,
    candidateId INT NOT NULL,
    FOREIGN KEY (candidateId) REFERENCES Candidate(id)
);