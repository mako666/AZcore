-- DB update 2022_03_11_00 -> 2022_03_11_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2022_03_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2022_03_11_00 2022_03_11_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1646700419097300800'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1646700419097300800');

DELETE FROM `areatrigger_scripts` WHERE `entry` = 3960;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(3960, 'at_zulgurub_temple_speech');

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2022_03_11_01' WHERE sql_rev = '1646700419097300800';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
