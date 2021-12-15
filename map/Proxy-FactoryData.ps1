while(1){ 
    wget http://localhost:8090/getFactory `
    | jq -rc '{"type": \"FeatureCollection\", "features": [.[] | { "type": \"Feature\", "geometry": { "type": \"Point\", "coordinates": [.location.x, .location.y, .location.z]}, "properties": (. | del(.location))}]}' `
    | Out-File -FilePath .\factory-geojson.json -Encoding utf8; 

    Start-Sleep -Seconds 20; 
}