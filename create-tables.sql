DROP SCHEMA IF EXISTS gtfs;

CREATE SCHEMA gtfs;

USE gtfs;

DROP TABLE IF EXISTS agency;

CREATE TABLE IF NOT EXISTS agency (
    agency_id               VARCHAR(20)     NOT NULL,
    agency_name             VARCHAR(255)    NOT NULL,
    agency_url              VARCHAR(255)    NOT NULL,
    agency_timezone         VARCHAR(50)     NOT NULL,
    agency_phone            VARCHAR(40),

    PRIMARY KEY (agency_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS routes;

CREATE TABLE IF NOT EXISTS routes (
    route_id                INT UNSIGNED    NOT NULL,
    agency_id               VARCHAR(20)     NOT NULL,
    route_short_name        VARCHAR(60)     NOT NULL,
    route_long_name         VARCHAR(100)    NOT NULL,
    route_desc              VARCHAR(255),
    route_type              TINYINT         NOT NULL,
    route_color             VARCHAR(10),
    route_text_color        VARCHAR(6),
    route_url               VARCHAR(255),

    PRIMARY KEY (route_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- IDX 1 and 2

DROP TABLE IF EXISTS shapes;

CREATE TABLE IF NOT EXISTS shapes (
    shape_id                INT UNSIGNED    NOT NULL,
    shape_pt_sequence       SMALLINT        NOT NULL,
    shape_pt_lat            VARCHAR(20)     NOT NULL,
    shape_pt_lon            VARCHAR(20)     NOT NULL,
    shape_dist_traveled     SMALLINT        NOT NULL,

    PRIMARY KEY (shape_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS calendar_dates;

CREATE TABLE IF NOT EXISTS calendar_dates (
    service_id              INT UNSIGNED    NOT NULL,
    cal_date				VARCHAR(8),
    exception_type          TINYINT,

  PRIMARY KEY (service_id, cal_date)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS trips;

CREATE TABLE IF NOT EXISTS trips (
    route_id                INT UNSIGNED    NOT NULL,
    service_id              INT UNSIGNED    NOT NULL,
    trip_id                 INT UNSIGNED    NOT NULL,
    realtime_trip_id        VARCHAR(30),
    trip_headsign           VARCHAR(80),
    trip_short_name         VARCHAR(30),
    trip_long_name          VARCHAR(100),
    direction_id            BOOLEAN,
    block_id                VARCHAR(20),
    shape_id                MEDIUMINT,
    wheelchair_accessible   TINYINT,
    bikes_allowed           TINYINT,
	trip_date				VARCHAR(8),

--  PRIMARY KEY (route_id, service_id, trip_id)
	PRIMARY KEY (trip_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- IDX 3, 4, 5

DROP TABLE IF EXISTS stops;

CREATE TABLE IF NOT EXISTS stops (
    stop_id                 VARCHAR(20)     NOT NULL,
    stop_code               VARCHAR(20),
    stop_name               VARCHAR(80)     NOT NULL,
    stop_lat                VARCHAR(20)     NOT NULL,
    stop_lon                VARCHAR(20)     NOT NULL,
    location_type           BOOLEAN,
    parent_station          BOOLEAN,
    stop_timezone           VARCHAR(50),
    wheelchair_boarding     TINYINT,
    platform_code           VARCHAR(20),
	zone_id					VARCHAR(20),
	
    PRIMARY KEY (stop_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS stop_times;

CREATE TABLE IF NOT EXISTS stop_times (
    trip_id                 INT UNSIGNED    NOT NULL,
    stop_sequence           SMALLINT        NOT NULL,
    stop_id                 VARCHAR(20)		NOT NULL,
    stop_headsign           VARCHAR(80),
    arrival_time            VARCHAR(10)     NOT NULL,
    departure_time          VARCHAR(10)     NOT NULL,
    pickup_type             TINYINT,
    drop_off_type           TINYINT,
    timepoint               BOOLEAN,
    shape_dist_traveled     DOUBLE,
    fare_units_traveled     DOUBLE,
--	trip_date				VARCHAR(8)

  PRIMARY KEY (trip_id, stop_id, stop_sequence, arrival_time, departure_time)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- IDX 6

DROP TABLE IF EXISTS transfers;

CREATE TABLE IF NOT EXISTS transfers (
    from_stop_id            VARCHAR(20)     NOT NULL,
    to_stop_id              VARCHAR(20)     NOT NULL,
    from_route_id           INT UNSIGNED,
    to_route_id             INT UNSIGNED,
    from_trip_id            INT UNSIGNED,
    to_trip_id              INT UNSIGNED,
    transfer_type           TINYINT         NOT NULL,
--    min_transfer_time       SMALLINT,

    PRIMARY KEY (from_stop_id, to_stop_id, from_route_id, to_route_id, from_trip_id, to_trip_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS trip_updates;

CREATE TABLE IF NOT EXISTS trip_updates (
    entity_id 			VARCHAR(30),
    route_id 			INT UNSIGNED,
    route_short_name 	VARCHAR(60),
    route_type 			TINYINT,
    trip_id 			INT UNSIGNED,
    direction_id 		BOOLEAN,
    start_date 			VARCHAR(8),
    start_time 			VARCHAR(10),
	stop_sequence 		SMALLINT,
    stop_id 			VARCHAR(20),
    arrival_time 		VARCHAR(10),
    arrival_delay 		SMALLINT,
    departure_time 		VARCHAR(10),
    departure_delay 	SMALLINT,
	fetch_time 			DATETIME
)  ENGINE=MYISAM DEFAULT CHARSET=UTF8MB4;