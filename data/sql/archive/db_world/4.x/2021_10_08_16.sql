-- DB update 2021_10_08_15 -> 2021_10_08_16
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_10_08_15';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_10_08_15 2021_10_08_16 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1633503057492950165'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1633503057492950165');

-- Change the min health to cast healing wave to a friendly from 20% to 50%.
UPDATE `smart_scripts` SET `event_param2` = 50, `comment` = 'Stonesplinter Shaman - On Friendly Between 0-50% Health - Cast \'Healing Wave\'' WHERE (`entryorguid` = 1197) AND (`source_type` = 0) AND (`id` = 1);

-- Add self heal to Stonesplinter Shaman
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 1197) AND (`source_type` = 0) AND (`id` =3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1197, 0, 3, 0, 2, 0, 100, 0, 0, 50, 17600, 35700, 0, 11, 547, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Stonesplinter Shaman - Between 0-50% Health - Cast \'Healing Wave\'');


--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_10_08_16' WHERE sql_rev = '1633503057492950165';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
