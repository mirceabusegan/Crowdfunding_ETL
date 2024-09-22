-- Droping tables if they exist

drop table if exists "campaign" ;
drop table if exists "category" ;
drop table if exists "subcategory" ;
drop table if exists "contacts" ;

-- Creating the 4 tables 
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10) NOT NULL, 
    "subcategory" VARCHAR(50) NOT NULL, 
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
    )	
);
SELECT * FROM subcategory;

CREATE TABLE "category" (
    "category_id" VARCHAR(10) NOT NULL, 
    "category" VARCHAR(50) NOT NULL, 
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
    )
);
SELECT * FROM category;

CREATE TABLE "contacts" (
    "contact_id" int NOT NULL, 
    "first_name" VARCHAR(50) NOT NULL, 
    "last_name" VARCHAR(50) NOT NULL, 
    "email" VARCHAR(100) NOT NULL, 
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
    )
);
SELECT * FROM contacts;

CREATE TABLE "campaign" (
    "cf_id" int NOT NULL,
    "contact_id" int NOT NULL,
    "company_name" VARCHAR(100) NOT NULL,
    "description" text NOT NULL,
    "goal" numeric(10,2) NOT NULL, 
    "pledged" numeric(10,2) NOT NULL,
    "outcome" VARCHAR(50) NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(10) NOT NULL, 
    "currency" VARCHAR(10) NOT NULL,
    "launch_date" date  NOT NULL, 
    "end_date" date  NOT NULL, 
    "category_id" VARCHAR(10) NOT NULL, 
    "subcategory_id" VARCHAR(10) NOT NULL, 
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
	    ),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);
SELECT * FROM campaign;
