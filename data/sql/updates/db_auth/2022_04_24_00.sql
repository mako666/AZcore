-- DB update 2022_01_23_00 -> 2022_04_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_auth' AND COLUMN_NAME = '2022_01_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_auth CHANGE COLUMN 2022_01_23_00 2022_04_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_auth WHERE sql_rev = '1650806750686513000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_auth` (`sql_rev`) VALUES ('1650806750686513000');

UPDATE `updates` SET `state`='ARCHIVED';

--
-- END UPDATING QUERIES
--
UPDATE version_db_auth SET date = '2022_04_24_00' WHERE sql_rev = '1650806750686513000';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
