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
	
-- NEW ONES
CREATE INDEX stop_times__trip_id
    ON stop_times(trip_id)
    USING HASH;