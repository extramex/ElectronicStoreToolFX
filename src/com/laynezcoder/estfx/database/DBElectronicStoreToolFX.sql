/*
 * Copyright 2020-2021 LaynezCode
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
DROP DATABASE IF EXISTS DBElectronicStoreToolFX;
CREATE DATABASE DBElectronicStoreToolFX;
USE DBElectronicStoreToolFX;

CREATE TABLE Customers (
	id INT NOT NULL AUTO_INCREMENT,
    customerName VARCHAR(150) NOT NULL,
    customerNumber VARCHAR(50) NOT NULL,
    customerEmail VARCHAR(150) NOT NULL,
    it VARCHAR(50) NOT NULL,
    insertionDate DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Quotes (
    id INT NOT NULL AUTO_INCREMENT,
    descriptionQuote LONGTEXT NOT NULL,
    requestDate DATE NOT NULL,
    price DOUBLE NULL,
    existence VARCHAR(20) NOT NULL,
    realization VARCHAR(20) NOT NULL,
    report VARCHAR (20) NOT NULL,
    customerId INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (customerId)
    REFERENCES Customers (id)
    ON DELETE CASCADE
);

CREATE TABLE Products (
	id INT NOT NULL AUTO_INCREMENT,
    barcode VARCHAR(25) NOT NULL,
    productName LONGTEXT NOT NULL,
    purchasePrice DOUBLE NOT NULL,
    porcentage INT NOT NULL,
    salePrice DOUBLE NOT NULL,
    minimalPrice DOUBLE NOT NULL,
    descriptionProduct LONGTEXT NOT NULL,
    imageProduct MEDIUMBLOB NOT NULL,
    insertionDate DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Users (
	id INT NOT NULL AUTO_INCREMENT,
    nameUser VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	pass VARCHAR(150) NOT NULL,
    biography LONGTEXT NOT NULL,
    dialogTransition VARCHAR(150) NOT NULL,
    userType VARCHAR(150) NOT NULL,
    profileImage LONGBLOB NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE UserSession (
	id INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (userId)
    REFERENCES Users (id)
);

CREATE TRIGGER triggerAddCustomerInsertDate BEFORE INSERT ON Customers	
    FOR EACH ROW SET NEW.insertionDate = NOW();
    
CREATE TRIGGER triggerAddProductInsertDate BEFORE INSERT ON Products	
	FOR EACH ROW SET NEW.insertionDate = NOW();

CREATE TRIGGER triggerAddDialogTransition BEFORE INSERT ON Users	
    FOR EACH ROW SET NEW.dialogTransition = "CENTER";
    
CREATE TRIGGER triggerAddBiography BEFORE INSERT ON Users	
    FOR EACH ROW SET NEW.biography = "Every day is a new opportunity to change your life.";