USE gtfs;
-- 1, 2
CREATE INDEX route__route_id
    ON routes(route_id)
    USING HASH;

CREATE INDEX route__agency_id
    ON routes(agency_id)
    USING HASH;

-- 3, 4, 5
CREATE INDEX trips__route_id
    ON trips(route_id)
    USING HASH;

CREATE INDEX trips__service_id
    ON trips(service_id)
    USING HASH;

CREATE INDEX trips__trip_id
    ON trips(trip_id)
    USING HASH;

-- 6
CREATE INDEX stop_times__stop_id
    ON stop_times(stop_id)
    USING HASH;

-- REST
-- REATE INDEX transfers__stop_ids
--    ON transfers(from_stop_id, to_stop_id)
--    USING HASH;
-- 
-- REATE INDEX transfers__stop_ids_reversed
--    ON transfers(to_stop_id, from_stop_id)
--    USING HASH;
-- 
-- REATE INDEX transfers__route_ids
--    ON transfers(from_route_id, to_route_id)
--    USING HASH;
-- 
-- REATE INDEX transfers__route_ids_reversed
--    ON transfers(to_route_id, from_route_id)
--    USING HASH;
-- 
-- REATE INDEX transfers__trip_ids
--    ON transfers(from_route_id, to_route_id)
--    USING HASH;
-- 
-- REATE INDEX transfers__trip_ids_reversed
--    ON transfers(to_trip_id, from_trip_id)
--    USING HASH;
	
-- NEW ONES
CREATE INDEX stop_times__trip_id
    ON stop_times(trip_id)
    USING HASH;