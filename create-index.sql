USE gtfs;
-- 1, 2
CREATE INDEX route__route_id
ON routes(route_id);

CREATE INDEX route__agency_id
ON routes(agency_id);

-- 3, 4, 5
CREATE INDEX trips__route_id
ON trips(route_id);

CREATE INDEX trips__service_id
ON trips(service_id);

CREATE INDEX trips__trip_id
ON trips(trip_id);

-- 6
CREATE INDEX stop_times__stop_id
ON stop_times(stop_id);

-- NEW ONES
CREATE INDEX stop_times__trip_id
ON stop_times(trip_id);

CREATE INDEX trip_updates__trip_id
ON trip_updates(trip_id);

CREATE INDEX trip_updates__stop_id
ON trip_updates(stop_id);