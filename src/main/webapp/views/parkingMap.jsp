<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Parking Map - Delhi</title>
    <style>
        #map {
            height: 600px;
            width: 100%;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3E6Yy8SUXtnVWmh3zj-UvmUppDimlXBE&callback=initMap"></script>
    <script>
        function initMap() {
            // Center map on Connaught Place, New Delhi
            var center = { lat: 28.6315, lng: 77.2167 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: center
            });

            // Example Delhi parking slots
            var parkingSlots = [
                { position: { lat: 28.6310, lng: 77.2167 }, title: "Parking Slot 1 - CP" },
                { position: { lat: 28.6295, lng: 77.2153 }, title: "Parking Slot 2 - Janpath" },
                { position: { lat: 28.6322, lng: 77.2200 }, title: "Parking Slot 3 - Palika Bazaar" },
                { position: { lat: 28.6344, lng: 77.2180 }, title: "Parking Slot 4 - KG Marg" }
            ];

            parkingSlots.forEach(function(slot) {
                new google.maps.Marker({
                    position: slot.position,
                    map: map,
                    title: slot.title
                });
            });
        }
    </script>
</head>
<body onload="initMap()">
    <h1>Delhi Parking Map</h1>
    <div id="map"></div>
</body>
</html>
