<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ParkFlow - Map</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        #map {
            height: 500px;
            width: 100%;
            margin-top: 20px;
        }

        .map-info {
            margin-top: 15px;
        }

        .map-link {
            color: #007bff;
            text-decoration: none;
        }

        .map-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <h2>Find Parking Locations</h2>
    <p>Use the map below to find parking spots near you.</p>
    <div id="map"></div>
    <div class="map-info" id="map-link-container"></div>

    <jsp:include page="footer.jsp" />

    <script>
        function initMap() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    var userLocation = { lat: lat, lng: lng };

                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 15,
                        center: userLocation
                    });

                    var marker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: 'You are here!'
                    });

                    // Add a link to open the location in Google Maps
                    var mapLinkContainer = document.getElementById('map-link-container');
                    mapLinkContainer.innerHTML = `
                        <p>Your live location: 
                            <a class="map-link" href="https://www.google.com/maps?q=${lat},${lng}" target="_blank">
                                Open in Google Maps
                            </a>
                        </p>`;
                }, function(error) {
                    alert('Error getting location: ' + error.message);
                });
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }
    </script>

    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3E6Yy8SUXtnVWmh3zj-UvmUppDimlXBE&callback=initMap">
    </script>
</body>
</html>
