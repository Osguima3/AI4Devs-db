-- Add new tables
CREATE TABLE Company (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

CREATE TABLE InterviewFlow (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE Position (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    interview_flow_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(255) NOT NULL,
    is_visible BOOLEAN NOT NULL,
    location VARCHAR(255),
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    employment_type VARCHAR(255),
    benefits TEXT,
    company_description TEXT,
    application_deadline DATE,
    contact_info VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES Company(id),
    FOREIGN KEY (interview_flow_id) REFERENCES InterviewFlow(id)
);

CREATE TABLE InterviewType (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE InterviewStep (
    id SERIAL PRIMARY KEY,
    interview_flow_id INT NOT NULL,
    interview_type_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    order_index INT NOT NULL,
    FOREIGN KEY (interview_flow_id) REFERENCES InterviewFlow(id),
    FOREIGN KEY (interview_type_id) REFERENCES InterviewType(id)
);

CREATE TABLE Application (
    id SERIAL PRIMARY KEY,
    position_id INT NOT NULL,
    candidate_id INT NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL,
    notes TEXT,
    FOREIGN KEY (position_id) REFERENCES Position(id),
    FOREIGN KEY (candidate_id) REFERENCES Candidate(id)
);

CREATE TABLE Interview (
    id SERIAL PRIMARY KEY,
    application_id INT NOT NULL,
    interview_step_id INT NOT NULL,
    employee_id INT NOT NULL,
    interview_date DATE NOT NULL,
    result VARCHAR(255),
    score INT,
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES Application(id),
    FOREIGN KEY (interview_step_id) REFERENCES InterviewStep(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

-- Add indices
CREATE INDEX idx_employee_company_id ON Employee(company_id);
CREATE INDEX idx_position_company_id ON Position(company_id);
CREATE INDEX idx_position_interview_flow_id ON Position(interview_flow_id);
CREATE INDEX idx_interview_step_interview_flow_id ON InterviewStep(interview_flow_id);
CREATE INDEX idx_interview_step_interview_type_id ON InterviewStep(interview_type_id);
CREATE INDEX idx_application_position_id ON Application(position_id);
CREATE INDEX idx_application_candidate_id ON Application(candidate_id);
CREATE INDEX idx_interview_application_id ON Interview(application_id);
CREATE INDEX idx_interview_interview_step_id ON Interview(interview_step_id);
CREATE INDEX idx_interview_employee_id ON Interview(employee_id);