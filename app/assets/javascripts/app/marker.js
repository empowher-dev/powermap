var locations = [
            ['Bondi Beach', -33.890542, 151.274856, 4],
            ['Coogee Beach', -25, 151.259052, 5],
            ['Cronulla Beach', -34.028249, 151.157507, 3],
            ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
            ['Maroubra Beach', -33.950198, 151.259302, 1]
        ];

        for (i = 0; i < locations.length; i++) {
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map,
            });

            (function(marker, i) {
                // add click event
                google.maps.event.addListener(marker, 'click', function() {
                    infowindow = new google.maps.InfoWindow({
                        content: '<h1>' + locations[i][0] + '</h1>' + '<div>' + locations[i][3] + '</div>',
                    });
                    infowindow.open(map, marker);
                });
            })(marker, i);
        };