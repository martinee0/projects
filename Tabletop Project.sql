-- While the tables are Dungeons and Dragons based, I am basing the names of the data off
-- of a video game I have this fixation of lately

CREATE TABLE CHARACTERS (
							CHARACTER_ID INT PRIMARY KEY,
                            CHARACTER_NAME VARCHAR(50) NOT NULL,
                            PLAYER_NAME VARCHAR(50) NOT NULL,
                            CLASS VARCHAR(30) NOT NULL,
                            RACE VARCHAR(30) NOT NULL,
                            LEVEL INT DEFAULT 1 NOT NULL,
                            EXP INT DEFAULT 0 NOT NULL );
                            
CREATE TABLE NPCS (
					NPC_ID INT PRIMARY KEY,
                    NPC_NAME VARCHAR(50) NOT NULL,
                    RACE VARCHAR(30) NOT NULL,
                    LEVEL INT NOT NULL,
                    LANGUAGE VARCHAR(30) );
                    
CREATE TABLE ITEMS (
						ITEM_ID INT PRIMARY KEY,
                        ITEM_NAME VARCHAR(50) NOT NULL, 
                        ITEM_TYPE VARCHAR(30) NOT NULL,
                        DESCRIPTION TEXT,
                        ITEM_WEIGHT DECIMAL CHECK (ITEM_WEIGHT >= 0) NOT NULL, 
                        QUANTITY INT CHECK (QUANTITY >=0) NOT NULL);
				
CREATE TABLE LOCATIONS (
						LOCATION_ID INT PRIMARY KEY,
						LOCATION_NAME VARCHAR(50) NOT NULL,
						TYPE VARCHAR(30) NOT NULL,
						SIZE VARCHAR(30) NOT NULL );
                    
CREATE TABLE QUESTS ( 
						QUEST_ID INT PRIMARY KEY,
                        DESCRIPTION TEXT NOT NULL,
                        DIFFICULTY VARCHAR(20) NOT NULL, 
                        REWARD VARCHAR(100),
                        NPC_ID INT, 
                        EXP INT CHECK (EXP >=0) NOT NULL,
                        FOREIGN KEY (NPC_ID) REFERENCES NPCS(NPC_ID) );
                        
CREATE TABLE MONSTERS (
						MONSTER_ID INT PRIMARY KEY,
                        MONSTER_NAME VARCHAR(50) NOT NULL,
                        HIT_POINTS INT CHECK (HIT_POINTS > 0) NOT NULL,
                        LEVEL INT CHECK (LEVEL > 0) NOT NULL,
                        TYPE VARCHAR(30) NOT NULL,
                        EXP INT CHECK (EXP >= 1) NOT NULL );
                        
                        
INSERT INTO CHARACTERS (CHARACTER_ID, CHARACTER_NAME, PLAYER_NAME, CLASS, RACE, LEVEL, EXP) 
	VALUES	(1, 'Serph', 'Matthew', 'Leader', 'Human', 1, 100),
			(2, 'Heat', 'Alice', 'Warrior', 'Human', 1, 100),
			(3, 'Argilla', 'Fred', 'Sniper', 'Human', 1, 100),
			(4, 'Gale', 'Derek', 'Strategist', 'Human', 1, 100),
			(5, 'Cielo', 'Alex', 'Support', 'Human', 1, 100),
			(6, 'Sera', 'Olivia', 'Healer', 'Human', 1, 100),
			(7, 'Roland', 'Jarod', 'Gunner', 'Human', 1, 100),
			(8, 'Seraph', 'Zoe', 'Leader', 'Atma Avatar', 2, 100);
    
INSERT INTO NPCS (NPC_ID, NPC_Name, RACE, LEVEL, LANGUAGE) 
	VALUES	(1, 'Angel', 'AI', 50, 'Digital'),
			(2, 'Harley', 'Human', 15, 'English'),
			(3, 'Jinana', 'Human', 20, 'English'),
			(4, 'Bat', 'Human', 18, 'English'),
			(5, 'Mick', 'Human', 10, 'English'),
			(6, '136', 'AI', 40, 'Digital'),
			(7, 'Jenna Angel', 'Human', 30, 'English'),
			(8, 'Margot Cuvier', 'Human', 25, 'English');
    
INSERT INTO ITEMS (ITEM_ID, ITEM_NAME, ITEM_TYPE, DESCRIPTION, ITEM_WEIGHT, QUANTITY) 
	VALUES	(1, 'Chakra Drop', 'Consumable', 'Restores a small amount of MP', 0.1, 50),
			(2, 'Bead Chain', 'Consumable', 'Fully restores HP to one ally', 0.2, 10),
			(3, 'Soma', 'Consumable', 'Fully restores HP and MP to all allies', 0.3, 5),
			(4, 'Amrita Soda', 'Consumable', 'Cures all status ailments', 0.1, 20),
			(5, 'Karma Ring', 'Accessory', 'Increases EXP gained', 0.5, 1),
			(6, 'Life Stone', 'Consumable', 'Restores a small amount of HP', 0.1, 30),
			(7, 'Dis-Poison', 'Consumable', 'Cures poison', 0.1, 15),
			(8, 'Attack Mirror', 'Consumable', 'Reflects attacks', 0.2, 5);
    
INSERT INTO LOCATIONS (LOCATION_ID, LOCATION_NAME, TYPE, SIZE) 
	VALUES	(1, 'Muladhara', 'City', 'Large'),
			(2, 'Svadhisthana', 'City', 'Large'),
			(3, 'Manipura', 'City', 'Large'),
			(4, 'Anahata', 'City', 'Large'),
			(5, 'Vishuddha', 'City', 'Large'),
			(6, 'Ajna', 'City', 'Large'),
			(7, 'Karma Temple', 'Dungeon', 'Massive'),
			(8, 'EGG Facility', 'Dungeon', 'Medium');
    
INSERT INTO QUESTS (QUEST_ID, DESCRIPTION, DIFFICULTY, REWARD, NPC_ID, EXP) 
	VALUES	(1, 'Investigate the Junkyard', 'Medium', 'Chakra Drop', 2, 150),
			(2, 'Defeat the rogue Vanguards in Muladhara', 'Hard', 'Karma Ring', 3, 300),
			(3, 'Secure the Embryon base', 'Medium', 'Amrita Soda', 4, 200),
			(4, 'Rescue allies trapped in Svadhisthana', 'Hard', 'Life Stone', 5, 350),
			(5, 'Uncover the truth about the Cyber Shaman', 'Very Hard', 'Dis-Poison', 1, 450),
			(6, 'Defeat the Tribhvana guardians', 'Extreme', 'Soma', 8, 600),
			(7, 'Investigate the black sun', 'Hard', 'Attack Mirror', 7, 320),
			(8, 'Reach the top of the Karma Temple', 'Extreme', 'Chakra Drop', 1, 700);

INSERT INTO MONSTERS (MONSTER_ID, MONSTER_NAME, HIT_POINTS, LEVEL, TYPE, EXP) 
	VALUES	(1, 'Omoikane', 200, 10, 'Beast', 50),
			(2, 'Naga', 150, 8, 'Naga', 40),
			(3, 'Pixie', 100, 5, 'Fairy', 25),
			(4, 'Jack Frost', 120, 6, 'Elemental', 30),
			(5, 'Cerberus', 300, 15, 'Beast', 75),
			(6, 'Pyro Jack', 250, 12, 'Avian', 60),
			(7, 'Parvati', 180, 9, 'Deity', 45),
			(8, 'Rakshasa', 220, 11, 'Fiend', 50);
            
            
-- Numbers are rounded just so it looks easier to read - I also just am not really into decimal
-- involvement when it comes to item management and their weights
            
-- Query 1's purpose is to list all characters and their classes and races from highest to low 
-- This sorting shows the strongest to weakest essentially
SELECT CHARACTER_NAME, CLASS, RACE, LEVEL
	FROM CHARACTERS
ORDER BY LEVEL DESC;


-- Query 2's purpose is to give a quantity to all the items and how much they weigh 
-- This allows for an easier way to collect and distribute to avoid over encumberment
SELECT ITEM_TYPE, COUNT(*) AS TOTAL_ITEMS, ROUND(AVG(ITEM_WEIGHT), 2) AS AVG_WEIGHT
	FROM ITEMS
GROUP BY ITEM_TYPE;


-- Query 3's purpose is to view available quests and their rewards allowing players to choose what 
-- matches their current needs as a growing character
SELECT Q.QUEST_ID, Q.DESCRIPTION, Q.REWARD, N.NPC_NAME, N.LEVEL AS NPC_LEVEL
	FROM QUESTS Q
JOIN NPCS N ON Q.NPC_ID = N.NPC_ID
	WHERE Q.REWARD IS NOT NULL;


-- Query 4's purpose is to list all quests with their difficulty and experience points allowing
-- players to see what offers the most 
SELECT DESCRIPTION, DIFFICULTY, EXP	
	FROM QUESTS
ORDER BY EXP DESC;


-- Query 5's purpose is to sort out what would be considered a difficult monster in order to challenge
-- players - This could be done through a hunting board or simply just a challenging enemy
SELECT MONSTER_NAME, HIT_POINTS, TYPE
	FROM MONSTERS
WHERE HIT_POINTS > (SELECT AVG(HIT_POINTS) FROM MONSTERS)
ORDER BY HIT_POINTS DESC;


-- Query 6's purpose is similar to query 3, although it lists based off difficulty opposed to 
-- showing based off of reward (and also showing the npc who assigns it)
SELECT Q.QUEST_ID, Q.DESCRIPTION, Q.DIFFICULTY, N.NPC_NAME
	FROM QUESTS Q
LEFT JOIN NPCS N ON Q.NPC_ID = N.NPC_ID;


-- Query 7's purpose is to show the average level of monsters based on their type
-- This allows for smoother progression planning and a more immersive hunting plan
SELECT TYPE, ROUND(AVG(LEVEL),1) AS AVERAGE_LEVEL
	FROM MONSTERS
    GROUP BY TYPE
ORDER BY AVERAGE_LEVEL DESC;


-- Query 8's purpose is to list all locations and what type they are - Players could probably view this under
-- a map with descriptions to further their travels
SELECT LOCATION_NAME, TYPE
	FROM LOCATIONS
ORDER BY TYPE, LOCATION_NAME;

-- Query 9's purpose is to list all NPCs and the languages they speak in order to prep planning
-- or just generally immerse the players
SELECT NPC_NAME, LANGUAGE
	FROM NPCS
ORDER BY LANGUAGE, NPC_NAME;

-- In some games the new locations players are lead to are based off of the average level of the characters
-- So the purpose of Query 10 would be to list that general average level of location and the NPCS in it
-- In order to allow smoother progression and a more balanced time playing
SELECT L.LOCATION_NAME, ROUND(AVG(N.LEVEL),1) AS AVERAGE_NPC_LEVEL
	FROM LOCATIONS L
LEFT JOIN NPCS N ON L.LOCATION_ID = N.NPC_ID
	GROUP BY L.LOCATION_NAME
ORDER BY AVERAGE_NPC_LEVEL DESC;