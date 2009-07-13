/*
 * TestLink Open Source Project - http://testlink.sourceforge.net/ 
 * This script is distributed under the GNU General Public License 2 or later. 
 * 
 * SQL script: Update schema MySQL database for TestLink 1.9 from version 1.8 
 * /* tblprefix */ - placeholder for tables with defined prefix
 *
 * $Id: db_schema_update.sql,v 1.1 2009/07/08 14:12:34 havlat Exp $
 *
 * Important Warning: 
 * This file will be processed by sqlParser.class.php, that uses SEMICOLON to find end of SQL Sentences.
 * It is not intelligent enough to ignore  SEMICOLONS inside comments, then PLEASE
 * USE SEMICOLONS ONLY to signal END of SQL Statements.
 */

/* builds */
ALTER TABLE /*tblprefix*/builds ADD COLUMN `creation_ts` datetime NOT NULL default NOW(),
ALTER TABLE /*tblprefix*/builds ADD COLUMN `release_date` date NULL,
ALTER TABLE /*tblprefix*/builds ADD COLUMN `closed_on_date` date NULL,


/* testplan_tcversions */
ALTER TABLE /*tblprefix*/testplan_tcversions ADD COLUMN author_id int(10) unsigned default NULL;
ALTER TABLE /*tblprefix*/testplan_tcversions ADD COLUMN creation_ts datetime default NOW();

/* data update */
INSERT INTO /*tblprefix*/rights (id,description) VALUES (23,'project_review');

INSERT INTO /*tblprefix*/role_rights (role_id,right_id) VALUES (8,23);

/* database version update */
INSERT INTO /*tblprefix*/db_version (version,notes,upgrade_ts) VALUES('DB 1.3', 'TestLink 1.9',CURRENT_TIMESTAMP());

/* ----- END ----- */