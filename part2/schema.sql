CREATE DATABASE IF NOT EXISTS pbz2;
USE pbz2;

DROP TABLE IF EXISTS provider;
DROP TABLE IF EXISTS detail;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS detail_amount;

CREATE TABLE provider
(
    provider_id VARCHAR(3) PRIMARY KEY,
    name        VARCHAR(30) NOT NULL,
    status      INT         NOT NULL,
    city        VARCHAR(60) NOT NULL
);

CREATE TABLE detail
(
    detail_id VARCHAR(3) PRIMARY KEY,
    name      VARCHAR(30) NOT NULL,
    colour    VARCHAR(30) NOT NULL,
    size      INT         NOT NULL,
    city      VARCHAR(60) NOT NULL
);

CREATE TABLE project
(
    project_id VARCHAR(4) PRIMARY KEY,
    name       VARCHAR(30) NOT NULL,
    city       VARCHAR(60) NOT NULL
);

CREATE TABLE detail_amount
(
    provider_id VARCHAR(64) NOT NULL,
    detail_id   VARCHAR(64) NOT NULL,
    project_id  VARCHAR(64) NOT NULL,
    s           INT         NOT NULL
);